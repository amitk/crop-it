require 'rails_helper'

RSpec.describe CountriesController, type: :controller do
  describe '#routes' do
    it { should route(:get, 'countries/index').to(action: 'index') }
  end

  describe "GET /index" do
    it 'returns ok' do
      get :index

      expect(response.status).to eq(200)
    end

    before { create_list(:country, 3) }

    context 'when param name is provided' do
      context 'when country with given name is not present' do
        it 'returns empty array', :aggregate_failures do
          get :index, params: { name: 'England' }

          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)).to eq([])
        end
      end

      context 'when country with name is present' do
        it 'returns country info', :aggregate_failures do
          get :index, params: { name: 'india' }

          assert_response
        end
      end
    end

    context 'when param code is provided' do
      context 'when country with given code is not present' do
        it 'returns empty array', :aggregate_failures do
          get :index, params: { code: 'BR' }
  
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)).to eq([])
        end
      end

      context 'when country with given code is present' do
        it 'returns country info', :aggregate_failures do
          get :index, params: { code: 'IND' }

          assert_response
        end
      end
    end

    context 'when param currency is provided' do
      context 'when countries with given currency are not present' do
        it 'returns empty array', :aggregate_failures do
          get :index, params: { currency: 'usd' }
  
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)).to eq([])
        end
      end

      context 'when countries with given currency are present' do
        it 'returns country info', :aggregate_failures do
          get :index, params: { currency: 'inr' }
  
          json_response = JSON.parse(response.body)
          expect(response.status).to eq(200)
          expect(json_response.count).not_to eq(0)
          expect(json_response.first['currencies'].keys).to include('INR')
        end
      end
    end

    context 'when param language is provided' do
      context 'when countries with given langugae are not present' do
        it 'returns empty array', :aggregate_failures do
          get :index, params: { language: 'punjabi' }
  
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)).to eq([])
        end
      end

      context 'when countries with given language are present' do
        it 'returns array of countries', :aggregate_failures do
          get :index, params: { language: 'hindi' }
  
          json_response = JSON.parse(response.body)
          expect(response.status).to eq(200)
          expect(json_response.count).not_to eq(0)
          expect(json_response.class).to eq(Array)
          expect(json_response.first['languages']).to eq({"eng" => "English", "hin" => "Hindi", "tam" => "Tamil"})
        end
      end
    end

    context 'when param capital city is provided' do
      context 'when country with given capital city is not present' do
        it 'returns empty array', :aggregate_failures do
          get :index, params: { capital_city: 'bengali' }
  
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)).to eq([])
        end
      end

      context 'when country with given capital city is present' do
        it 'returns array of countries', :aggregate_failures do
          get :index, params: { capital_city: 'delhi' }
  
          json_response = JSON.parse(response.body)
          expect(response.status).to eq(200)
          expect(json_response.count).not_to eq(0)
          expect(json_response.class).to eq(Array)
          expect(json_response.first['languages']).to eq({"eng" => "English", "hin" => "Hindi", "tam" => "Tamil"})
        end
      end
    end

    context 'when param region is provided' do
      context 'when countries with given region are not present' do
        it 'returns empty array', :aggregate_failures do
          get :index, params: { region: 'europe' }
  
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)).to eq([])
        end
      end

      context 'when counties with give region are present' do
        it 'returns array of countries', :aggregate_failures do
          get :index, params: { region: 'asia' }
  
          json_response = JSON.parse(response.body)
          expect(response.status).to eq(200)
          expect(json_response.count).to eq(3)
          expect(json_response.class).to eq(Array)
          expect(json_response.first['region']).to eq('Asia')
        end
      end
    end

    context 'when list of fields are provided to return filtered data' do
      context 'when list of fields which are valid' do
        it 'returns empty array', :aggregate_failures do
          get :index, params: { fields: 'name, region, origin'}

          json_response = JSON.parse(response.body)
          expect(json_response.count).to eq(3)
          expect(json_response.first['region']).to eq('Asia')
          expect(json_response.first['origin']).to eq(nil)
        end
      end
    end
  end

  def assert_response
    response_body = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(response_body['name']['common']).to eq('India')
    expect(response_body['cca3']).to eq('IND')
    expect(response_body['currencies']).to eq({"INR"=>{"name"=>"Indian rupee", "symbol"=>"₹"}})
    expect(response_body['languages']).to eq({"eng"=>"English", "hin"=>"Hindi", "tam"=>"Tamil"})
  end
end
