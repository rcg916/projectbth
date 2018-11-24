class AddCornholeToUserlocations < ActiveRecord::Migration[5.2]
  def change
  	add_column :userlocations, :cornhole, :boolean, default: false
  	add_column :userlocations, :food, :boolean, default: false
  	add_column :userlocations, :karaoke, :boolean, default: false
  	add_column :userlocations, :dancing, :boolean, default: false
  end
end
