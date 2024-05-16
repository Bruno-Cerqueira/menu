class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    flash[:notice] = 'Adicione ingrediente.'
    @ingredient = Ingredient.new
    @ingredient.ingredient_prices.build
  end

  def create
    @ingredient = Ingredient.new(name: ingredient_params[:name])

    respond_to do |format|
      if @ingredient.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.append('ingredients_table', partial: 'ingredient_created',
                                                                        locals: { ingredient: @ingredient })
        end
        format.html { redirect_to(ingredients_url, notice: '#{ingredient.name} added.') }
      else
        # TODO: respond notice
        format.html { render :new, status: 422 }
      end
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:id, :name, ingredient_prices_attributes: %i[id price source])
  end
end
