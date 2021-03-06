require "freshdesk/version"
require "freshdesk/configuration"
require "errors/configuration"
require "freshdesk/ticket"
require "freshdesk/solution"

require 'net/http'
require 'uri'
require 'json'
module Freshdesk
  #class << self bit tells our Freshdesk module that this instance variable is on the module scope
  class << self
    attr_accessor :configuration
  end

  #Writing and reading the configuration
  def self.configuration
    @configuration ||= Configuration.new
  end

  #Resetting
  #This will reset the @configuration settings to nil if needed in future
  def self.reset
    @configuration = Configuration.new
  end

  #Passing a block to our class
  #When we call Freshdesk.configure, we pass it a block that actually creates a new instance of the Freshdesk::Configuration class using whatever we’ve set inside of the block.
  def self.configure
    yield(configuration)
  end

  def self.valid_json?(json)
    JSON.parse(json)
    return true
  rescue JSON::ParserError => e
    return false
  end

end
