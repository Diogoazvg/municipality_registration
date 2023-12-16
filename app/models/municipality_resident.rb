# frozen_string_literal: true

require 'uploaders/image_uploader'
require 'services/cns'

class MunicipalityResident < ApplicationRecord
  searchkick callbacks: :async
  include Uploaders::ImageUploader::Attachment(:image)
  include BaseErrors
  include TwilioClient

  has_one :address
  accepts_nested_attributes_for :address

  validates :full_name, :email, :birthday, :phone_number, :cpf, :cns, :image_data, presence: true
  validates :cpf, uniqueness: { case_sensitive: false }
  validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: I18n.t('errors.messages.allow_digits') }
  validate :valid_cpf?, :valid_birthday?, :valid_email?, :valid_cns?

  after_create :delivery_messages_create
  after_update :delivery_messages_update

  private

  def valid_cpf?
    add_errors(:cpf, 'invalid') unless CPF.valid?(cpf)
  end

  def valid_birthday?
    add_errors(:birthday, 'invalid') if birthday.to_s >= Date.current.to_s
  end

  def valid_email?
    add_errors(:email, 'invalid') unless email =~ URI::MailTo::EMAIL_REGEXP
  end

  def valid_cns?
    add_errors(:cns, 'invalid') unless Services::Cns.validate(cns)
  end

  def delivery_messages_create
    call_message(I18n.t('sms.messages.registered_successfully'))
  end

  def delivery_messages_update
    return unless updated_at_previously_changed?

    call_message(I18n.t('sms.messages.updated_data'))
  end

  def call_message(message)
    send_message(body: message, to: "+55#{phone_number}")

    ApplicationMailer.send_email(self).deliver_now
  end
end
