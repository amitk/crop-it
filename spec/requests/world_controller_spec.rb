require 'rails_helper'

RSpec.describe WorldController, type: :controller do
  let(:country) { create(:country) }
  describe 'routes' do
    it { should route(:get, '/world/index').to(action: 'index') }
    it { should route(:get, '/world/population').to(action: 'population') }
    it { should route(:get, '/world/region').to(action: 'region') }
    it { should route(:get, '/world/flag').to(action: 'flag') }
    it { should route(:get, '/world/maps').to(action: 'maps') }
  end

  before do
    create_list(:country, 1)
  end
  describe '#index' do

    it 'returns status 200' do
      get :index

      expect(response.status).to eq(200)
    end

    it 'returns a world data in json format' do
      get :index

      json_response = JSON.parse(response.body)
      expect(json_response.first.keys).to eq(["area", "code", "currencies", "flag", "maps", "name", "population", "region"])
    end
  end

  describe '#population' do
    it 'returns 200' do
      get :population

      expect(response.status).to eq(200)
    end

    it 'returns population with country name' do
      get :population

      json_response = JSON.parse(response.body)
      expect(json_response).to eq({country.name => country.population})
    end
  end

  describe '#region' do
    it 'returns 200' do
      get :region

      expect(response.status).to eq(200)
    end

    it 'returns region with country name' do
      get :region

      json_response = JSON.parse(response.body)
      expect(json_response).to eq({country.name => country.data['region']})
    end
  end

  describe '#flag' do
    it 'returns 200' do
      get :flag

      expect(response.status).to eq(200)
    end

    it 'returns flag with country name' do
      get :flag

      json_response = JSON.parse(response.body)
      expect(json_response).to eq({country.name => country.data['flag']})
    end
  end

  describe '#maps' do
    it 'returns 200' do
      get :maps

      expect(response.status).to eq(200)
    end

    it 'returns maps with country name' do
      get :maps

      json_response = JSON.parse(response.body)
      expect(json_response).to eq({country.name => country.data['maps']})
    end
  end

  describe '#area' do
    it 'returns 200' do
      get :area

      expect(response.status).to eq(200)
    end

    it 'returns area with country name' do
      get :area

      json_response = JSON.parse(response.body)
      expect(json_response).to eq({country.name => country.data['area']})
    end
  end
end
