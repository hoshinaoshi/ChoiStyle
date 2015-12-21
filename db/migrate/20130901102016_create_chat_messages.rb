class CreateChatMessages < ActiveRecord::Migration
  def change
    create_table :chat_messages do |t|
      t.integer :chat_id
      t.integer :user_type
      t.text :message
      t.string :image

      t.timestamps
    end
    add_index :chat_messages, :chat_id
  end
end
