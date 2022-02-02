class AddGeoToSalons < ActiveRecord::Migration[6.1]
  def change
    add_column :salons, :latitude, :float
    add_column :salons, :longitude, :float
  end
end
