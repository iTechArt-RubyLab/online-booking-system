class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :middle_name, empty: true
      t.integer :salon_id, null: true
      t.string :email, null: false, unique: true
      t.string :work_email, null: true, unique: true
      t.string :phone, null: false
      t.string :work_phone, null: true
      t.datetime :birthday, null: false
      t.integer :role, null: false, default: 0
      t.integer :status, null: true, default: 0
      t.text :notes, empty: true
      t.string :image_url, null: false
      t.integer :rating, null: true, default: 0

      t.timestamps
    end
  end
end
