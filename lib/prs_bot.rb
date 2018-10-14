require 'http'
require 'schmooze'
require 'eth'
require 'active_support/all'
require 'prs_bot/utility_schmoozer'
require 'prs_bot/utility'
require 'prs_bot/api'
require 'prs_bot/client'
require 'prs_bot/errors'

module PrsBot
  class<< self
    attr_accessor :keystore, :password, :dependencies_path
  end

  def self.api
    @api ||= PrsBot::API.new(options={})
  end

  def self.utility
    @utility ||= PrsBot::Utility.new(options={})
  end
end
