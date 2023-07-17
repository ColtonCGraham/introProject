class Location < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :coordinates, presence: true
  has_many :matches
end
