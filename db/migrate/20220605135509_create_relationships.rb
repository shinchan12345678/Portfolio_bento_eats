class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :customer_id
      t.integer :owner_id

      t.timestamps
    end

    add_index :relationships, [:customer_id, :owner_id], unique: true
  end
end
