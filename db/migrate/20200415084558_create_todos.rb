class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
    
      t.bigint :user_id,    null: false, foreign_key: true
      t.text :lead_text,     null: false
      t.text :content_text,  null: false

      t.timestamps
    end
  end
end