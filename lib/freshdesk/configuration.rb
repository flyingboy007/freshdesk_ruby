module Freshdesk
  class Configuration
    attr_accessor :api_key, :url

    def initialize
      @api_key = nil
      @url = nil
    end

    def api_key
      raise Freshdesk::Errors::Configuration, "Freshdesk api_key missing!" unless @api_key
      @api_key
    end

    def url
      raise Freshdesk::Errors::Configuration, "Freshdesk url missing!" unless @url
      @url
    end

  end
end 