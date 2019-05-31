# frozen_string_literal: true

class OutfitItem < ApplicationRecord
  attr_accessor :item_id, :outfit_id

  belongs_to :item
  belongs_to :outfit
end
