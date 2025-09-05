class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      if params[:selected_ingredients]
        @recipe.ingredient_ids = params[:selected_ingredients]
      end
      redirect_to @recipe
    else
      @ingredients = Ingredient.all
      render :new
    end
  end

  def edit
    @ingredients = Ingredient.all
  end

  def update
    if @recipe.update(recipe_params)
      if params[:selected_ingredients]
        @recipe.ingredient_ids = params[:selected_ingredients]
      else
        @recipe.ingredient_ids = []
      end
      redirect_to @recipe
    else
      @ingredients = Ingredient.all
      render :edit
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name)
  end
end
