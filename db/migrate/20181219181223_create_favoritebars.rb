class CreateFavoritebars < ActiveRecord::Migration[5.2]
  def change
    create_table :favoritebars do |t|
      t.references :bar, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
