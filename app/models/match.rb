class Match < ApplicationRecord
  has_many :teams
  belongs_to :sport
  belongs_to :location
end
