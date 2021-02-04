# frozen_string_literal: true

require_relative "prs_bot/api"
require_relative "prs_bot/utility"
require_relative "prs_bot/version"

# Include #api & #utility
module PrsBot
  class PrsBotError < StandardError; end

  def self.api(*args, **kargs)
    @api ||= PrsBot::API.new(*args, **kargs)
  end

  def self.utility
    @utility ||= PrsBot::Utility.new
  end
end
