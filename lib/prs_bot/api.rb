# frozen_string_literal: true

module PrsBot
  # wrap RESTful apis
  class API
    BASE = 'press.one/api/v2'

    attr_reader :client, address:, private_key:

    def initialize(base = BASE, :address, :private_key)
      @client = HttpClient.new(base)
      @address = address
      @private_key = private_key
    end

    def sign; end
  end
end
