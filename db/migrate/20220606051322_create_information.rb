class CreateInformation < ActiveRecord::Migration[6.1]
  def change
    create_table :information do |t|
      t.integer :owner_id
      t.date :open_date, null: false
      t.date :close_date, null: false
      t.string :comment, default: "特にありません"
      # 緯度
      t.decimal :latitude, precision: 9, scale: 6, index: true, null: false
      # 経度
      t.decimal :longitude, precision: 9, scale:6, index: true, null: false
      t.integer :is_valid, default: 0, null: false

      t.timestamps
    end
  end
end
