# Class representing an ingredient usage in the application.
class IngredientUsage < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient
end
