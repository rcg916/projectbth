class AddBarIdToBrands < ActiveRecord::Migration[5.2]
  def change
  	add_column :brands, :bar_id, :integer
  end
end
