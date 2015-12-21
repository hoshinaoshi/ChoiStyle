class CreateCutModels < ActiveRecord::Migration
  def change
    create_table :cut_models do |t|
      t.integer :user_id
      t.integer :prefecture, :default => 0
      t.integer :area, :default => 0
      t.integer :hair_long, :default => 0
      t.integer :hair_type, :default => 0
      t.integer :volume, :default => 0
      t.integer :wavy, :default => 0
      t.integer :when_parm, :default => 0
      t.integer :when_color, :default => 0
      t.integer :want_long, :default => 0
      t.integer :want_style, :default => 0
      t.text    :want_style_text
      t.integer :can_style, :default => 0
      t.text    :can_style_text
      t.text    :my_self    
      t.boolean :deleted,:default => false

      t.timestamps
    end
    add_index :cut_models, :user_id
    add_index :cut_models, :hair_long
    add_index :cut_models, :hair_type
    add_index :cut_models, :volume
    add_index :cut_models, :wavy
    add_index :cut_models, :want_long
    add_index :cut_models, :want_style
    add_index :cut_models, :can_style
    add_index :cut_models, :prefecture
    add_index :cut_models, :area
  end
end
