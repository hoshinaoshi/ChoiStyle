class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :salon_id
      t.integer :stylist_id
      t.integer :cut_model_id
      t.integer :status,:default => 0
      t.integer :offer_type
      t.string  :subject
      t.text    :content
      t.boolean :deleted,:default => false

      t.timestamps
    end
    add_index :offers, :salon_id
    add_index :offers, :stylist_id
    add_index :offers, :cut_model_id
    add_index :offers, :status
    add_index :offers, :deleted
  end
end
