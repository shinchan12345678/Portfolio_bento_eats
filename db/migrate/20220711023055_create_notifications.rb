class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :customer_id, null: false
      t.integer :owner_id, null: false
      t.integer :coupon_id
      t.integer :information_id
      t.integer :category, null: false
      t.boolean :is_checked, default: false, null: false

      t.timestamps
    end
  end
end
