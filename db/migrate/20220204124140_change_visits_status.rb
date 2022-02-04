class ChangeVisitsStatus < ActiveRecord::Migration[6.1]
  def change
    change_column :visits, :status, :string
    change_column_null :visits, :status, false
  end
end
