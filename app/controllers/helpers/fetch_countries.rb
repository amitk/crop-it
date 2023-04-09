module Helpers
  module FetchCountries

    def result
      return by_name if params['name'].present?

      return by_code if params['code'].present?

      return by_currency if params['currency'].present?

      return by_language if params['language'].present?

      return by_capital_city if params['capital_city'].present?

      return by_region if params['region'].present?

      return filtered_fields if params['fields'].present?
      
      Country.all
    end

    private

    def by_name  
      Country.find_by("LOWER(name) = LOWER(?)", params['name']).try(:data)
    end

    # find country by cca2, cca3, ccn3, cioc or fifa code, query the database to get the results.
    def by_code
      code = params[:code].upcase
      Country.find_by("data->'cca2' ? :value OR data->'cca3' ? :value OR data->'ccn3' ? :value OR data->'cioc' ? :value OR data->'fifa' ? :value",
      value: "#{code}").try(:data)
    end

    def by_currency
      currency = params['currency'].upcase
      Country.where('currencies @> ?', "{#{currency}}").pluck(:data)
    end

    def by_language
      language = params['language'].downcase
      Country.where('languages @> ?', "{#{language}}").pluck(:data)
    end

    def by_capital_city
      Country.where("data ->> 'capital' ILIKE ?", "%#{params['capital_city'].downcase}%").pluck(:data)
    end

    def by_region
      Country.where("data ->> 'region' ILIKE ?", "%#{params['region']}%").pluck(:data)
    end

    def filtered_fields
      fields = data_fields & params['fields'].downcase.split(',').map(&:strip)
      fields = fields.collect{ |c| "data->'#{c}' as #{c}" }.join(', ')
      fields = "id, " + fields
      Country.select(fields)
    end

    def data_fields
      Country.first.data.keys.sort
    end
  end
end
