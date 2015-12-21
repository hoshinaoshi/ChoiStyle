class CreateSalons < ActiveRecord::Migration
  def change
    create_table :salons do |t|
      t.integer :user_id
      t.integer :salon_prefecture, :default => 0
      t.string  :salon_name
      t.string  :salon_url
      t.string  :salon_tel
      t.string  :salon_location
      t.integer :salon_area, :default => 0
      t.string  :salon_zip
      t.string  :salon_station
      t.string  :billing_zip
      t.string  :billing_location
      t.boolean :deleted, :default => false

      t.timestamps
    end
    add_index :salons, :user_id
    add_index :salons, :salon_prefecture
  end
end
