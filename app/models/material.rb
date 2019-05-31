class Material < ApplicationRecord
  class Item < ApplicationRecord
    has_many :item_materials
    has_many :items, through: :item_materials

    validates_presence_of :name
  end
end
