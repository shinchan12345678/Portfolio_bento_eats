class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :customer_id
      t.integer :item_id

      t.timestamps
    end
    add_index :favorites, [:customer_id, :item_id], unique: true
  end
end
