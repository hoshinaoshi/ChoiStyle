class CreateOpinion < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.integer :user_id
      t.text    :opinion_content
    end
  end
end
