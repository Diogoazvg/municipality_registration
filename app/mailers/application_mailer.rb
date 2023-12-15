# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: ENV['FROM_EMAIL']
  layout 'mailer'

  def send_email(m_resident)
    @m_resident = m_resident
    mail(to: @m_resident.email, subject: I18n.t('email.messages.Welcome to County'))
  end
end
