class CreateItemMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :item_materials do |t|
      t.references :item, foreign_key: true
      t.references :material, foreign_key: true
    end
  end
end
