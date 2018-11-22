class AddFieldsToUserlocations < ActiveRecord::Migration[5.2]
  def change
  	add_column :userlocations, :livemusic, :boolean, default: false
  	add_column :userlocations, :pool, :boolean, default: false
  	add_column :userlocations, :darts, :boolean, default: false
  end
end
