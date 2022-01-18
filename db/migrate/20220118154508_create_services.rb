class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.integer :category_id, null: false, default: 0
      t.integer :salon_id, null: false
      t.string :name, null: false, index: { unique: true }
      t.text :description, null: false
      t.integer :duration, null: false, default: 1
      t.integer :price, null: false, default: 1
      t.integer :hidden_price
      t.integer :availability, null: false

      t.timestamps
    end
  end
end
