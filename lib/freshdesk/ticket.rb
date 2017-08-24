module Freshdesk
  class Ticket
    def self.create_a_ticket(options)
      uri = URI.parse(Freshdesk.configuration.url+"/api/v2/tickets")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(uri)
      request["cache-control"] = 'no-cache'
      request.basic_auth(Freshdesk.configuration.api_key, "X")
      request["content-type"] = 'application/json'
      request.body = JSON.dump(options)
      response = http.request(request)
      JSON.parse(response.body, :symbolize_names => true)
    end
  end
end

