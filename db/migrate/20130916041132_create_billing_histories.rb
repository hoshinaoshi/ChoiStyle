class CreateBillingHistories < ActiveRecord::Migration
  def change
    create_table :billing_histories do |t|
      t.integer :month
      t.integer :salon_id
      t.integer :stylist_id
      t.integer :total_amount

      t.timestamps
    end
    add_index :billing_histories, :month
    add_index :billing_histories, :salon_id
    add_index :billing_histories, :stylist_id
  end
end
