class DeleteImagUrlFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :image_url, :string
  end
end
