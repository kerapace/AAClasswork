class AddNewColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :formation_year, :integer
    add_column :bands, :location, :string
  end
end
