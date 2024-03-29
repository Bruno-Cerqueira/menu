class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :name, null: false, unique: true
      t.text :description, default: nil, null: true

      t.timestamps
    end
  end
end
