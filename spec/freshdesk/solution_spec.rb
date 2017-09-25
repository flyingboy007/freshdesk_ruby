require_relative '../spec_helper'

describe Freshdesk::Solution do

 context 'view all folders under a category' do
    it 'is success' do
      VCR.use_cassette('freshdesk/solutions/view_all_solutions/success') do
        category_id=76767676
        response=Freshdesk::Solution.list_all_folders(category_id)
        expect(response).to be_an_instance_of(Array)
      end
    end

    it 'with no tickets email' do
      no_existing_query=1
      VCR.use_cassette('freshdesk/solutions/view_all_solutions/with_non_existing_id') do
        response=Freshdesk::Solution.list_all_folders(no_existing_query)
        expect(response).to eq('404 Not Found')
      end
    end

    it 'with invalid query parameter' do
      VCR.use_cassette('freshdesk/solutions/view_all_solutions/invalid_query_param') do
        response=Freshdesk::Solution.list_all_folders("invalid=something")
        expect(response).to eq('404 Not Found')
      end
    end

  end
 context 'view all articles under a folder' do
    it 'is success' do
      VCR.use_cassette('freshdesk/solutions/view_all_articles/success') do
        solutions_id=52525252
        response=Freshdesk::Solution.list_all_articles(solutions_id)
        expect(response).to be_an_instance_of(Array)
      end
    end

    it 'with no tickets email' do
      no_existing_query=1
      VCR.use_cassette('freshdesk/solutions/view_all_articles/with_non_existing_id') do
        response=Freshdesk::Solution.list_all_articles(no_existing_query)
        expect(response).to eq('404 Not Found')
      end
    end

    it 'with invalid query parameter' do
      VCR.use_cassette('freshdesk/solutions/view_all_articles/invalid_query_param') do
        response=Freshdesk::Solution.list_all_articles("invalid=something")
        expect(response).to eq('404 Not Found')
      end
    end

  end



end