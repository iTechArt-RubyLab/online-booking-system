class ChangePatronymicToMiddleName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :patronymic, :middle_name
  end
end
