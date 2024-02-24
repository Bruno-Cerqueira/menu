class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
    @ingredient.ingredient_prices.build
  end

  def create
    if ingredient_params[:id].present?
      @ingredient = Ingredient.find(ingredient_params[:id])
    elsif @ingredient = Ingredient.create!(name: ingredient_params[:name])
    end
    @ingredient_price = @ingredient.ingredient_prices.build(ingredient_params[:ingredient_prices_attributes][0])

    if @ingredient.save!
      format.html { redirect_to(ingredients_url, notice: '#{ingredient.name} added.') }
    else
      render :new
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:id, :name, ingredient_prices_attributes: %i[id price source])
  end
end
