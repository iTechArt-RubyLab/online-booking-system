class CreateProfessionalsSalons < ActiveRecord::Migration[6.1]
  def change
    create_table :professionals_salons do |t|
      t.integer :professional_id, null: false
      t.integer :salon_id, null: false

      t.timestamps
    end

    add_foreign_key :professionals_salons, :users, column: :professional_id, primary_key: :id, on_delete: :cascade
    add_foreign_key :professionals_salons, :salons, column: :salon_id, primary_key: :id, on_delete: :cascade
  end
end
