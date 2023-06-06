# frozen_string_literal: true

module TwilioClient
  def send_message(body:, to:)
    client.messages.create(body:, from: ENV['TWILIO_FROM'], to:)
  end

  private

  def client
    Conectors::TwilioConector.instance.gateway
  end
end
