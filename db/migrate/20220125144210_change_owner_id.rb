class ChangeOwnerId < ActiveRecord::Migration[6.1]
  def change
    change_table :salons do |t|
      t.remove :owner_id
      t.integer :salon_owner_id, null: false
    end

    add_foreign_key :salons, :users, column: :salon_owner_id, primary_key: :id, on_delete: :cascade
  end
end
