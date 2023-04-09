require 'rails_helper'

RSpec.describe Country, type: :model do
  describe '#validation' do
    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:population) }

    it { should validate_presence_of(:code) }
  end
  
  describe '#world_data' do
    let(:country) { create(:country) }
    
    it 'must contain a detail country hash', :aggregate_failures do
      detail_hash = country.my_data
      
      expect(detail_hash[:area]).to eq(country.data['area'])
      expect(detail_hash[:code]).to eq(country.code)
      expect(detail_hash[:currencies]).to eq(country.data['currencies'])
      expect(detail_hash[:flag]).to eq(country.data['flag'])
      expect(detail_hash[:maps]).to eq(country.data['maps'])
      expect(detail_hash[:name]).to eq(country.name)
      expect(detail_hash[:population]).to eq(country.population)
      expect(detail_hash[:region]).to eq(country.data['region'])
    end
  end
end
