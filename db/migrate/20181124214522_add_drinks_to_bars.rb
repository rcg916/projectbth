class AddDrinksToBars < ActiveRecord::Migration[5.2]
  def change
  	add_column :bars, :beer, :boolean, default: false
  	add_column :bars, :vodka, :boolean, default: false
  	add_column :bars, :whiskey, :boolean, default: false
  	add_column :bars, :wine, :boolean, default: false
  end
end
