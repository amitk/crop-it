class CountriesController < ApplicationController
include Helpers::FetchCountries

  def index
    render json: result.nil? ? [] : result
  end
end
