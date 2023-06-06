# frozen_string_literal: true

require 'singleton'

module Conectors
  class TwilioConector
    include Singleton

    ACCOUNT_SID = ENV['ACCOUNT_SID']
    AUTH_TOKEN = ENV['AUTH_TOKEN']

    def gateway
      Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    end
  end
end
