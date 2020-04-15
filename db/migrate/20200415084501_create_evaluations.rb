class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.bigint :user_id,     null: false, foreign_key: true
      t.bigint :item_id,     null: false, foreign_key: true
      t.integer :evaluation
 
      t.timestamps
    end
  end
end
