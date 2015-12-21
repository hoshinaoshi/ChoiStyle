class CreateStylistImage < ActiveRecord::Migration
  def change
    create_table :stylist_images do |t|
      t.integer :stylist_id
      t.string :image
    end
    add_index :stylist_images, :stylist_id
  end
end
