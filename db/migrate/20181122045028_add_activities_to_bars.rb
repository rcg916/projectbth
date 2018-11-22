class AddActivitiesToBars < ActiveRecord::Migration[5.2]
  def change
  	add_column :bars, :activities, :string, array: true, default: []
  end
end
