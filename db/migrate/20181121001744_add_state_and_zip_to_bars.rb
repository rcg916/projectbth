class AddStateAndZipToBars < ActiveRecord::Migration[5.2]
  def change
  	add_column :bars, :state, :string
  	add_column :bars, :zipcode, :integer
  end
end
