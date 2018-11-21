class AddLivemusicToBars < ActiveRecord::Migration[5.2]
  def change
  	add_column :bars, :livemusic, :boolean, default: false
  	add_column :bars, :pool, :boolean, default: false
  	add_column :bars, :darts, :boolean, default: false
  end
end
