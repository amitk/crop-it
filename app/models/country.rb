class Country < ApplicationRecord

  validates :name, :population, :code,  presence: true
end
