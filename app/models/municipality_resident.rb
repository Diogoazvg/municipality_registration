# frozen_string_literal: true

require 'uploaders/image_uploader'
require 'services/cns'

class MunicipalityResident < ApplicationRecord
  searchkick callbacks: :async
  include Uploaders::ImageUploader::Attachment(:image)
  include BaseErrors

  has_one :address
  accepts_nested_attributes_for :address

  validates :full_name, :email, :birthday, :phone_number, :cpf, :cns, presence: true
  validate :valid_cpf?, :valid_birthday?, :valid_email?, :valid_cns?

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
end
