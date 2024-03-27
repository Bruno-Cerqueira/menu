class CreateIngredientQuantities < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredient_quantities do |t|
      t.integer :quantity
      t.string :measurement_type
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
