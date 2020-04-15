class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      #Add
      t.bigint :user_id,         optional: true, foreign_key: true
      t.string :lastname,        null: false
      t.string :firstname,       null: false
      t.string :lastname_kana,   null: false
      t.string :firstname_kana,  null: false
      t.text :postal_code,        null: false
      t.integer :prefecture,        null: false
      t.text :municipality,      null: false
      t.text :street,            null: false
      t.text :building
      t.string :telephone_number

      t.timestamps
    end
  end
end

