class AddWantedactivitiesToUserlocation < ActiveRecord::Migration[5.2]
  def change
  	add_column :userlocations, :wantedactivities, :string, array: true, default: []
  end
end
