require 'rails_helper'

RSpec.describe "Links", type: :request do

  describe "#create" do
    context "when url is not present" do
      it 'returns error' do
        expect{ post '/link' }.to raise_error(ActionController::ParameterMissing)
      end
    end

    context 'when url is present' do
      let(:url) { 'https://www.a-dummy-url-for-testing.com/a+testing?is:conductedon?this+link'}
      it 'returns 200' do
        post '/link', params: { url: url }

        expect(response.status).to eq(200)
      end

      it 'returns short_url' do
        post '/link', params: { url: url }
        
        base_url = request.base_url
        expect(response.body).to eq("#{base_url}/#{Link.last.code}")
      end
    end
  end

  describe "#show" do
  context 'when code is present' do
    context 'when link is absent' do
      it 'returns 404' do
        get '/ser253EWS'
        
        expect(response.status).to eq(404)
      end
    end
    
    context 'when link is present' do
      let!(:link_record) { create(:link) }
        it 'redirects to actual url' do
          get "/#{link_record.code}"
          
          expect(response).to redirect_to(link_record.url)
        end
      end
    end
  end
end
