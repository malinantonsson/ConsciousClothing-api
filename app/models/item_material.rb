# frozen_string_literal: true

class ItemMaterial < ApplicationRecord
  attr_accessor :item_id, :material_id

  belongs_to :item
  belongs_to :material
end
