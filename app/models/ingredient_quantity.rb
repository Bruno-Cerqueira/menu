# Class to register quantities for ingredients
class IngredientQuantity < ApplicationRecord
  belongs_to :ingredient
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :measurement_type, presence: true
end
