class ChangeCategoryInServices < ActiveRecord::Migration[6.1]
  def change
    change_table :services do |t|
      t.remove :category
      t.references :category, null: false, foreign_key: { on_delete: :cascade }
    end
  end
end
