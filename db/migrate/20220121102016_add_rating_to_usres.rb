class AddRatingToUsres < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :rating, :integer 
  end
end
