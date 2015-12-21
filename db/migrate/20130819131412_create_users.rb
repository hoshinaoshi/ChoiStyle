class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Base
      t.string :name        , :null => false, :default => ""
      t.string :nick_name   , :null => false, :default => ""
      t.integer :user_type
      t.integer :gender     , :null => false, :default => 0
      t.integer :quit_flag  , :null => false, :default => 0
      
      t.string :provider    , :null => false
      t.integer :u_id       , :null => false, :limit => 8
      t.string :u_name      , :null => false, :default => ""
      t.string :token       , :null => false
      t.string :secret_token

      ## Trackable
      t.datetime :last_sign_in_at

      t.timestamps
    end

    add_index :users, :user_type
    add_index :users, :gender
    add_index :users, :provider
    add_index :users, :u_id
  end
end
