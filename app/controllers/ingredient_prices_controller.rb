class IngredientPricesController < ApplicationController
    def new
        @ingredient_price = IngredientPrice.new
      end
    
      def create
        @ingredient_price = IngredientPrice.new(ingredient_price_params)
        if @ingredient_price.save
          redirect_to @ingredient_price, notice: 'Ingredient price was successfully created.'
        else
          render :new
        end
      end
    
      private
    
      def ingredient_price_params
        params.require(:ingredient_price).permit(:ingredient_id, :price, :source)
      end
end
