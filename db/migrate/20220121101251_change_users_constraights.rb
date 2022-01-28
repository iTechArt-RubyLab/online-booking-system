class ChangeUsersConstraights < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :work_email, true 
    change_column_null :users, :work_phone, true 
    change_column_null :users, :status, true  
    change_column_null :users, :salon_id, true   
  end
end
