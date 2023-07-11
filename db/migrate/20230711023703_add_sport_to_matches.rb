class AddSportToMatches < ActiveRecord::Migration[7.0]
  def change
    add_reference :matches, :sport, null: false, foreign_key: true
  end
end
