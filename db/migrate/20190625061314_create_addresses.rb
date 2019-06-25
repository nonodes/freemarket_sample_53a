class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :post_code, null: false
      t.string :city, null: false
      t.string :town, null: false
      t.integer :block, null: false
      t.string :building_name, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
