class Team < ApplicationRecord
  has_and_belongs_to_many :players
  has_one :sport
end
