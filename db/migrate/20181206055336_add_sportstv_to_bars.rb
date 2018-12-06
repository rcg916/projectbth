class AddSportstvToBars < ActiveRecord::Migration[5.2]
  def change
  	add_column :bars, :tequila, :boolean, default: false
  	add_column :bars, :cocktails, :boolean, default: false
  	add_column :bars, :sportstv, :boolean, default: false
  	add_column :bars, :happyhour, :boolean, default: false
  end
end
