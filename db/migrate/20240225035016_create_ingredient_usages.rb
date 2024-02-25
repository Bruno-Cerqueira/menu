class CreateIngredientUsages < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredient_usages do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.integer :quantity, null: true
      t.string :unit_of_measure, null: true

      t.timestamps
    end
  end
end
