class IngredientsController < ApplicationController
    def index
        @ingredients = Ingredient.all
    end

    def new
        @ingredient = Ingredient.new
        @ingredient.ingredient_prices.build
    end

    def create
        @ingredient = Ingredient.save!(ingredient_params)

        respond_to do |format|
            format.html { redirect_to(ingredients_url, :notice => '#{ingredient.name} added.') }
        end
    end

    private

    def ingredient_params
        params.require(:ingredient).permit(:name, ingredient_prices_attributes: [:id, :price, :source])
    end
end
