class AddUniqueConstraintToIngredientUsages < ActiveRecord::Migration[7.0]
  def change
    add_index :ingredient_usages, [:dish_id, :ingredient_id], unique: true, name: "unique_dish_and_ingredient"
  end
end
