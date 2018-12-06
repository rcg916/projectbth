class AddSportstvToUserlocations < ActiveRecord::Migration[5.2]
  def change
  	add_column :userlocations, :tequila, :boolean, default: false
  	add_column :userlocations, :cocktails, :boolean, default: false
  	add_column :userlocations, :sportstv, :boolean, default: false
  	add_column :userlocations, :happyhour, :boolean, default: false
  end
end
