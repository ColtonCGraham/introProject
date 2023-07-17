class Player < ApplicationRecord
  validates :name, presence: true
  paginates_per 50
  has_and_belongs_to_many :teams
end
