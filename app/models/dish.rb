class Dish < ApplicationRecord
    has_many :ingredient_usages
    has_many :ingredients, through: :ingredient_usages

    validates :name, presence: true, uniqueness: true
end
