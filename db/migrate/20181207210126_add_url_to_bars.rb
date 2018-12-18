class AddUrlToBars < ActiveRecord::Migration[5.2]
  def change
  	add_column :bars, :websiteurl, :string
  end
end
