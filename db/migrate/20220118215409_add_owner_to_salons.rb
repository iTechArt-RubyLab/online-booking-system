class AddOwnerToSalons < ActiveRecord::Migration[6.1]
  def change
    add_column :salons, :owner_id, :bigint, null: false
  end
end
