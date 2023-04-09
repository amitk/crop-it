# Fetch country data from https://restcountries.com/ Thanks a lot for this

namespace :fetch do
  COUNTRY_DATA_FETCH_URL = "https://restcountries.com/v3.1/all"
  desc "Get all counties data from external api"
  task country_data: :environment do
    response = Faraday.get(COUNTRY_DATA_FETCH_URL)
    exit puts "Unable to fetch data from the server" unless response.status == 200
    begin
      json_response = JSON.parse(response.body)
      
      Country.destroy_all
      json_response.each do |country|
        Country.create!(
          {
            name: country['name']['common'],
            code: country['cca3'],
            population: country['population'],
            currencies: country['currencies'] && country['currencies'].keys,
            languages: country['languages'] && (country['languages'].keys.map(&:downcase) + country['languages'].values.map(&:downcase)),
            data: country
          }
        )
      end

      puts 'All countries data fetched successfully, country data updated!'
    rescue => e
        puts "Data update failure, failed due to: #{e}"
    end
  end
end
