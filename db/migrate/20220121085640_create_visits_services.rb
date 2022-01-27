class CreateVisitsServices < ActiveRecord::Migration[6.1]
  def change
    create_table :visits_services do |t|
      t.integer :visit_id, null: false, foreign_key: { on_delete: :cascade }
      t.integer :service_id, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
