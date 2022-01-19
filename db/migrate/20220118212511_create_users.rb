class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :patronymic, empty: true
      t.integer :salon_id, null: false
      t.string :email, null: false, unique: true
      t.string :work_email, null: false, unique: true
      t.string :phone, null: false
      t.string :work_phone, null: false
      t.datetime :birthday, null: false
      t.integer :role, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.text :notes, empty: true
      
      t.timestamps
    end
  end
end
