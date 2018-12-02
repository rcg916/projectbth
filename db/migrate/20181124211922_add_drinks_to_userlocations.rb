class AddDrinksToUserlocations < ActiveRecord::Migration[5.2]
  def change
  	add_column :userlocations, :beer, :boolean, default: false
  	add_column :userlocations, :vodka, :boolean, default: false
  	add_column :userlocations, :whiskey, :boolean, default: false
  	add_column :userlocations, :wine, :boolean, default: false
  end
end
