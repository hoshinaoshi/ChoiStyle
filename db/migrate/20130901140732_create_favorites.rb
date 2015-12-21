class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :salon_id
      t.integer :stylist_id
      t.integer :cut_model_id
      t.boolean :deleted,:default => false

      t.timestamps
    end
    add_index :favorites, :user_id
  end
end
