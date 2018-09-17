require 'active_support'
require 'base64'
require 'openssl'
require 'digest/sha3'
require 'eth'
require 'bitcoin-secp256k1'
require_relative './prs_bot/auth'
require_relative './prs_bot/api'

module PrsBot
  class<< self
    attr_accessor :keystore, :password
  end

  def self.api
    @api ||= PrsBot::API.new
  end

  def self.auth
    @auth ||= PrsBot::Auth.new
  end
end
