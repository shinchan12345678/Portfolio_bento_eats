class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :customer_id
      t.integer :owner_id
      t.integer :coupon_id
      t.integer :information_id
      t.integer :category
      t.boolen :is_checked

      t.timestamps
    end
  end
end
