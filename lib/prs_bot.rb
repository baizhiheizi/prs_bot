require 'http'
require 'active_support/all'
require 'ecdsa'
require 'eth'
require_relative './prs_bot/auth'
require_relative './prs_bot/api'
require_relative './prs_bot/client'
require_relative './prs_bot/errors'

module PrsBot
  class<< self
    attr_accessor :keystore, :password
  end

  def self.api
    @api ||= PrsBot::API.new(options={})
  end

  def self.auth
    @auth ||= PrsBot::Auth.new(options={})
  end
end
