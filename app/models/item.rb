class Item < ApplicationRecord
  has_many :item_materials
  has_many :materials, through: :item_materials

  has_many :outfit_items
  has_many :outfits, through: :outfit_items


  validates_presence_of :name
end
