class Ingredient < ApplicationRecord
  has_many :ingredient_prices
  has_many :ingredient_usages
  has_many :dishes, through: :ingredient_usages
  has_many :ingredient_quantities
  accepts_nested_attributes_for :ingredient_prices

  validates :name, presence: true, uniqueness: true

  scope :available, -> { joins(:ingredient_quantities).where('ingredient_quantities.quantity > 0') }

end
