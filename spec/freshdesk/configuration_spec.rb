require_relative '../spec_helper'

describe Freshdesk::Configuration do
  context 'with configuration block' do
    it 'returns the correct freshdesk auth_key' do
      expect(Freshdesk.configuration.url).to eq(ENV['FRESHDESK_URL'])
    end
    it 'returns the correct freshdesk url' do
      expect(Freshdesk.configuration.api_key).to eq(ENV['FRESHDESK_API_KEY'])
    end
  end

  context '#reset' do
    it 'resets configured values' do
      expect(Freshdesk.configuration.url).to eq(ENV['FRESHDESK_URL'])
      expect(Freshdesk.configuration.api_key).to eq(ENV['FRESHDESK_API_KEY'])

      Freshdesk.reset
      expect { Freshdesk.configuration.url }.to raise_error(Freshdesk::Errors::Configuration)
      expect { Freshdesk.configuration.api_key }.to raise_error(Freshdesk::Errors::Configuration)
    end
  end

  context 'without configuration block' do
    before do
      Freshdesk.reset
    end

    it 'raises a configuration error for url' do
      expect { Freshdesk.configuration.url }.to raise_error(Freshdesk::Errors::Configuration)
    end

    it 'raises a configuration error for api_key' do
      expect { Freshdesk.configuration.api_key }.to raise_error(Freshdesk::Errors::Configuration)
    end
  end


end