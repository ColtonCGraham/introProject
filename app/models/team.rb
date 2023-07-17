class Team < ApplicationRecord
  validates :name, presence: true
  has_and_belongs_to_many :players
  belongs_to :sport
  has_and_belongs_to_many :matches
end
