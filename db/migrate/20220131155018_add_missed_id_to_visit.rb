class AddMissedIdToVisit < ActiveRecord::Migration[6.1]
  def change
    change_table :visits do |t|
      t.references :user, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.references :salon, null: false, foreign_key: true
  end

  add_index :visits, [:user_id, :service_id, :client_id, :salon_id], unique: true, name: 'index_visits_on_user_id_service_id_client_id_salon_id'
  end
end
