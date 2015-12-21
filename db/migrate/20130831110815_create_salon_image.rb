class CreateSalonImage < ActiveRecord::Migration
  def change
    create_table :salon_images do |t|
      t.integer :salon_id
      t.string :image
    end
    add_index :salon_images, :salon_id
  end
end
