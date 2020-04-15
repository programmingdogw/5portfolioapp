class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.bigint :user_id,         optional: true, foreign_key: true
      t.text :postal_code,        null: false
      t.timestamps
    end
  end
end
