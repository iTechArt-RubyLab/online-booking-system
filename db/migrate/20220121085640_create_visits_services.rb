class CreateVisitsServices < ActiveRecord::Migration[6.1]
  def change
    create_table :visits_services do |t|
      t.integer :visit_id, null: false, foreign_key: true
      t.integer :salon_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
