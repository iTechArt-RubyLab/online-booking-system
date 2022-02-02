class RemoveSalonIdFromVisits < ActiveRecord::Migration[6.1]
  def change
    remove_column :visits, :salon_id
  end
end
