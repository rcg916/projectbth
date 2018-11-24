class AddCornholeToBars < ActiveRecord::Migration[5.2]
  def change
  	add_column :bars, :cornhole, :boolean, default: false
  	add_column :bars, :food, :boolean, default: false
  	add_column :bars, :karaoke, :boolean, default: false
  	add_column :bars, :dancing, :boolean, default: false
  end
end
