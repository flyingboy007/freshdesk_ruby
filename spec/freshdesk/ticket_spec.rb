require_relative '../spec_helper'

describe Freshdesk::Ticket do
  
  context "Create a Ticket" do
   ticket_params= {
        "description": "Details about the issue...",
        "subject": "TEST::Support Needed...",
        "email": "test@test.com",
        "priority": 1,
        "status": 2,
    }
    
    
    it "is success" do
      VCR.use_cassette("freshdesk/create_a_ticket/success") do
        response=Freshdesk::Ticket.create_a_ticket(ticket_params)
        expect(response[:id]).not_to be nil
      end
    end

    it "is validation error" do
      VCR.use_cassette("freshdesk/create_a_ticket/failure_invalid_token") do
        response=Freshdesk::Ticket.create_a_ticket({
                                                       "description": "Details about the issue...",
                                                       "subject": "TEST::Support Needed...",
                                                       "priority": 1,
                                                       "status": 2,
                                                   })
        expect(response[:description]).to eq("Validation failed")
      end
    end
  end
end