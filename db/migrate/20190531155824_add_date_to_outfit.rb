class AddDateToOutfit < ActiveRecord::Migration[5.2]
  def change
    add_column :outfits, :date, :string
  end
end
