class CreateOrderHistories < ActiveRecord::Migration
  def change
    create_table :order_histories do |t|
      t.integer :order_date
      t.integer :salon_id
      t.integer :stylist_id
      t.integer :order_amount

      t.timestamps
    end
    add_index :order_histories, :order_date
    add_index :order_histories, :salon_id
    add_index :order_histories, :stylist_id
  end
end
