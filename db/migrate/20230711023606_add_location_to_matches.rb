class AddLocationToMatches < ActiveRecord::Migration[7.0]
  def change
    add_reference :matches, :location, null: false, foreign_key: true
  end
end
