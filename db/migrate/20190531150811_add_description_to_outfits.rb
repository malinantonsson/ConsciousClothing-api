class AddDescriptionToOutfits < ActiveRecord::Migration[5.2]
  def change
    add_column :outfits, :description, :string
  end
end
