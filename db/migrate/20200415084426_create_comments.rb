class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      #Add
      t.bigint :user_id,         null: false, foreign_key: true
      t.bigint :item_id,         null: false, foreign_key: true
      t.string :comment_content,  null: false

      t.timestamps
    end
  end
end
