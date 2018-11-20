class CreateUserlocations < ActiveRecord::Migration[5.2]
  def change
    create_table :userlocations do |t|
      t.string :searchterm
      t.timestamps
    end
  end
end
