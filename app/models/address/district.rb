class Address::District < ApplicationRecord
  validates :code, uniqueness: true
  validates :name, presence: true

  belongs_to :region
  belongs_to :province

  has_many :city_municipalities
end