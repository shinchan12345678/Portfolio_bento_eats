class CreateInformation < ActiveRecord::Migration[6.1]
  def change
    create_table :information do |t|
      t.integer :owner_id
      t.date :open_date
      t.date :close_date
      t.integer :is_valid

      t.timestamps
    end
  end
end
