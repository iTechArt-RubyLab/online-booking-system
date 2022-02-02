class AddCalumnImagesToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :image_url, :string
  end
end
