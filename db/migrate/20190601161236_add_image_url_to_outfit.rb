class AddImageUrlToOutfit < ActiveRecord::Migration[5.2]
  def change
    add_column :outfits, :image_url, :string
  end
end
