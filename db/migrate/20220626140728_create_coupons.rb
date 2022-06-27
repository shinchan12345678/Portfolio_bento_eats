class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.integer :customer_id, null: false
      t.integer :owner_id, null: false
      t.integer :group_id, null: false
      t.integer :discount, null: false
      t.integer :is_valid, default: 0, null: false
      t.date :using_period, null: false
      t.string :condition

      t.timestamps
    end
  end
end
