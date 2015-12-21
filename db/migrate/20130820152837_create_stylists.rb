class CreateStylists < ActiveRecord::Migration
  def change
    create_table :stylists do |t|
      t.integer :user_id
      t.integer :salon_id
      t.string  :name
      t.integer :gender, :default => 0
      t.string  :nick_name
      t.integer :target, :default => 0
      t.integer :base_price, :default => 0
      t.integer :want_long, :default => 0
      t.integer :want_style, :default => 0
      t.text    :want_style_text
      t.integer :can_style, :default => 0
      t.text    :can_style_text
      t.text    :my_self
      t.integer :salon_prefecture, :default => 0
      t.string  :salon_name
      t.string  :salon_url
      t.string  :salon_tel
      t.string  :salon_zip
      t.string  :salon_location
      t.integer :salon_area, :default => 0
      t.string  :salon_station
      t.string  :billing_zip
      t.string  :billing_location
      t.boolean :deleted,:default => false
      t.integer :order_amount, :default => 0
      t.boolean :order_update_flag,:default => false

      t.timestamps
    end
    add_index :stylists, :user_id
    add_index :stylists, :salon_id
    add_index :stylists, :target
    add_index :stylists, :want_long
    add_index :stylists, :want_style
    add_index :stylists, :salon_area
    add_index :stylists, :salon_prefecture
  end
end
