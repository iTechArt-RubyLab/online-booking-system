class AddSalonsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :salons do |t|
      t.string :name, null: false, uniqueness: true
      t.text :address, null: false
      t.string :phone, null: false
      t.string :email, default: '', null: false
      t.text :notes, null: false
      t.integer :owner_id, null: false

      t.timestamps
    end
  end
end
