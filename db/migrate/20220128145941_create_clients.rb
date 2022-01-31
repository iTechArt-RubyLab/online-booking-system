class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :middle_name, null: false
      t.string :email, null: false, unique: true
      t.string :phone, null: false, unique: true
      t.datetime :birthday, null: false
      t.text :notes, empty: true
      t.string :image_url, null: false
      t.integer :rating, null: false, default: 0

      t.timestamps
    end

    add_foreign_key :visits, :clients, column: :client_id, on_delete: :cascade
  end
end
