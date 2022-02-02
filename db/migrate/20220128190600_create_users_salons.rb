class CreateUsersSalons < ActiveRecord::Migration[6.1]
  def change
    create_table :users_salons do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :salon_id, null: false, foreign_key: true

      t.timestamps
    end

    add_foreign_key :users_salons, :users, on_delete: :cascade
    add_foreign_key :users_salons, :salons, on_delete: :cascade
    add_index :users_salons, %i[user_id salon_id], unique: true
  end
end
