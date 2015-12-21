class CreateCutModelImage < ActiveRecord::Migration
  def change
    create_table :cut_model_images do |t|
      t.integer :cut_model_id
      t.string :image
    end
    add_index :cut_model_images, :cut_model_id
  end
end
