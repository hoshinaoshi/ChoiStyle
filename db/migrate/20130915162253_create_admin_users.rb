class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :admin_users, :user_id
  end
end
