class CreateSocialNetworks < ActiveRecord::Migration[6.1]
  def change
    create_table :social_networks do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :salon_social_networks do |t|
      t.references :salon, null: false, foreign_key: true
      t.references :social_network, null: false, foreign_key: true
      t.string :link, null: false

      t.timestamps
    end

    add_index :salon_social_networks, [:salon_id, :social_network_id], unique: true
  end
end
