module Freshdesk
  class Solution
    def self.list_all_folders(query)
      uri = URI.parse(Freshdesk.configuration.url+"/api/v2/solutions/categories/#{query}/folders")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(uri)
      request.basic_auth(Freshdesk.configuration.api_key, "X")
      request["content-type"] = 'application/json'
      response = http.request(request)


      if Freshdesk.valid_json?(response.body)
        JSON.parse(response.body, :symbolize_names => true)
      else
        #this is string response during error cases
        response['status']
      end
    end

    def self.list_all_articles(query)
      uri = URI.parse(Freshdesk.configuration.url+"/api/v2/solutions/folders/#{query}/articles")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(uri)
      request.basic_auth(Freshdesk.configuration.api_key, "X")
      #request["content-type"] = 'application/json'
      response = http.request(request)


      if Freshdesk.valid_json?(response.body)
        JSON.parse(response.body, :symbolize_names => true)
      else
        #this is string response during error cases
        response['status']
      end
    end

    def self.get_article(query)
      uri = URI.parse(Freshdesk.configuration.url+"/api/v2/solutions/articles/#{query}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(uri)
      request.basic_auth(Freshdesk.configuration.api_key, "X")
      #request["content-type"] = 'application/json'
      response = http.request(request)


      if Freshdesk.valid_json?(response.body)
        JSON.parse(response.body, :symbolize_names => true)
      else
        #this is string response during error cases
        response['status']
      end
    end
  end
end

