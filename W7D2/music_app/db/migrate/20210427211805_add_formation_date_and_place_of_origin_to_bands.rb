class AddFormationDateAndPlaceOfOriginToBands < ActiveRecord::Migration[5.2]
  def change
    add_index :bands, :formation_year, :integer
    add_index :bands, :location, :string
  end
end
