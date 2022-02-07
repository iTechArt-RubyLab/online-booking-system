class ChangeStatusOnUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :status, :string
    change_column_null :users, :status, false
  end
end
