class CreateOutfits < ActiveRecord::Migration[5.2]
  def change
    create_table :outfits do |t|
      t.string :title
      t.string :created_by

      t.timestamps
    end
  end
end
