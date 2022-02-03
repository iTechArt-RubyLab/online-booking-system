class AddRemindUpMinToSalons < ActiveRecord::Migration[6.1]
  def change
    add_column :salons, :remind_up_min, :integer, null: false, default: 60
  end
end
