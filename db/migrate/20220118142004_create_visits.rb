class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.integer :price, null: false
      t.text :address, null: false
      t.integer :status, null:false
      # t.integer :salon_id, null: false, foreign_key: true
      # t.integer :client_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
