class Ingredient < ApplicationRecord
    has_many :ingredient_prices
    accepts_nested_attributes_for :ingredient_prices

    validates :name, presence: true, uniqueness: true
end
