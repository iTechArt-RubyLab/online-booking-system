class AddSalonsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :salons do |t|
      t.string :name, null: false, uniqueness: true
      t.text :address, null: false

      t.timestamps
    end
  end
end
