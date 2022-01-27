class AddSalonIdAndClientIdToVisits < ActiveRecord::Migration[6.1]
  def change
    change_table :visits do |t|
      t.integer :client_id, null: false
      t.integer :salon_id, null: false, foreign_key: true
    end

    add_foreign_key :visits, :users, column: :client_id, on_delete: :cascade
  end
end
