class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :offer_id
      t.integer :salon_id
      t.integer :stylist_id
      t.integer :cut_model_id

      t.timestamps
    end
    add_index :chats, :offer_id
    add_index :chats, :salon_id
    add_index :chats, :stylist_id
    add_index :chats, :cut_model_id
  end
end
