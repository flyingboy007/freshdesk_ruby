require "bundler/setup"
require "freshdesk"
require "support/vcr_setup"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  #for mocking external services requests
  require 'webmock/rspec'
  WebMock.disable_net_connect!(allow_localhost: true)

  #For adding auth key
    #Before begining to run test please set the below environments
    config.before(:all) do
        Freshdesk.configure do |config|
            config.url = ENV['FRESHDESK_URL']
            config.api_key = ENV['FRESHDESK_API_KEY']
          end
      end
  
end
