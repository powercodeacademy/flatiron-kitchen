class IngredientsController < ApplicationController 
  def edit 
    @ingredient = Ingredient.find(params[:id])
  end

  def update 
    @ingredient = Ingredient.find(params[:id])

    if @ingredient.update(ingredient_params)
      redirect_to @ingredient 
    else 
      render :edit, status: :unprocessable_entity 
    end
  end

  private 

  def ingredient_params 
    params.require(:ingredient).permit(:name)
  end
end
