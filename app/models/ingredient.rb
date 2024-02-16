class Ingredient < ApplicationRecord
    has_many :ingredient_prices

    validates :name, presence: true, uniqueness: true
end
