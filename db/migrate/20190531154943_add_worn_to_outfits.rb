class AddWornToOutfits < ActiveRecord::Migration[5.2]
  def change
    add_column :outfits, :worn, :boolean
  end
end
