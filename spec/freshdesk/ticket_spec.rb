require_relative '../spec_helper'

describe Freshdesk::Ticket do

  context 'Create a Ticket' do
    ticket_params= {
        description: 'Details about the issue...',
        subject: 'TEST::Support Needed...',
        email: 'test@test.com',
        priority: 1,
        status: 2,
    }


    it 'is success' do
      VCR.use_cassette('freshdesk/create_a_ticket/success') do
        response=Freshdesk::Ticket.create_a_ticket(ticket_params)
        expect(response[:id]).not_to be nil
      end
    end

    it 'is validation error' do
      VCR.use_cassette('freshdesk/create_a_ticket/failure_invalid_token') do
        response=Freshdesk::Ticket.create_a_ticket({
                                                       description: 'Details about the issue...',
                                                       subject: 'TEST::Support Needed...',
                                                       priority: 1,
                                                       status: 2
                                                   })
        expect(response[:description]).to eq('Validation failed')
      end
    end
  end

  context 'view all tickets on a specific email id' do
    query= "email=test@test.com"
    it 'is success' do
      VCR.use_cassette('freshdesk/view_all_by_email/success') do
        response=Freshdesk::Ticket.view_all(query)
        expect(response).to be_an_instance_of(Array)
      end
    end

    it 'with no tickets email' do
      no_ticket_query="email=no_ticket@gmail.com"
      VCR.use_cassette('freshdesk/view_all_by_email/with_no_tickets') do
        response=Freshdesk::Ticket.view_all(no_ticket_query)
        expect(response[:errors].first[:message]).to eq('There is no contact matching the given email')
      end
    end
    it 'with invalid email' do
      VCR.use_cassette('freshdesk/view_all_by_email/invalid_email') do
        response=Freshdesk::Ticket.view_all("email=invalid")
        expect(response[:errors].first[:message]).to eq('There is no contact matching the given email')
      end
    end

    it 'with invalid query parameter' do
      VCR.use_cassette('freshdesk/view_all_by_email/invalid_query_param') do
        response=Freshdesk::Ticket.view_all("invalid=something")
        expect(response[:errors].first[:message]).to eq('Unexpected/invalid field in request')
      end
    end
  end

  context 'Get one ticket on a specific email id' do

  end

end