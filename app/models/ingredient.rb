class Ingredient < ApplicationRecord
  has_many :ingredient_prices
  has_many :ingredient_usages
  has_many :dishes, through: :ingredient_usages
  accepts_nested_attributes_for :ingredient_prices

  validates :name, presence: true, uniqueness: true
end
