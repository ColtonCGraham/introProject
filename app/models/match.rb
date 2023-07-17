class Match < ApplicationRecord
  has_and_belongs_to_many :teams
  belongs_to :sport
  belongs_to :location
  validates :date, presence: true
end
