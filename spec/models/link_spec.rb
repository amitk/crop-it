require 'rails_helper'

RSpec.describe Link, type: :model do
  describe '#validations' do
    let(:link) { build(:link) }

    it 'checks presence for url' do
      expect(link.url).to be_present 
    end

    it 'checks presence of code' do
      expect(link.code).to be_present
    end
  end

  describe '#before_validation' do
    describe '#generate_code' do
      let(:link) { build(:link) }
      it "calls method on create" do
        expect(link).to receive(:generate_code)

        link.save!
      end

      it "does not calls method on update" do
        link.save

        expect(link).not_to receive(:generate_code)
        link.update(url: 'https://www.dummy.com')
      end
    end
  end

  describe '#short_url' do
    let(:link) { create(:link) }
    let(:host) { 'https://cut.it' }
    it 'generate short url' do
      short_url = link.short_url("https://cut.it")

      expect(short_url).to eq("#{host}/#{link.code}")
    end
  end
end
