class RenameColumnInBrands < ActiveRecord::Migration[5.2]
  def change
  	rename_column :brands, :type, :brandtype
  end
end
