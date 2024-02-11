class CreateIngredientPrices < ActiveRecord::Migration[7.0]
  def change
    def change
      create_table :ingredient_prices do |t|
        t.references :ingredient, foreign_key: true
        t.integer :price
        t.string :source, default: nil, null: true
        t.timestamps
      end
    end
  end
end
