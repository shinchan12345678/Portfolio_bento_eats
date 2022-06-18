class CreateInformation < ActiveRecord::Migration[6.1]
  def change
    create_table :information do |t|
      t.integer :owner_id
      t.date :open_date
      t.date :close_date
      # 緯度
      t.decimal :latitude, precision: 9, scale: 6, index: true
      # 経度
      t.decimal :longitude, precision: 9, scale:6, index: true
      t.integer :is_valid, default: 0

      t.timestamps
    end
  end
end
