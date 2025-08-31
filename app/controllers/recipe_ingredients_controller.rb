class RecipeIngredientsController < ApplicationController
  before_action :set_recipe_ingredient, only: %i[show edit update destroy]

  # GET /recipe_ingredients
  def index
    @recipe_ingredients = RecipeIngredient.all
  end

  # GET /recipe_ingredients/1
  def show
  end

  # GET /recipe_ingredients/new
  def new
    @recipe_ingredient = RecipeIngredient.new
  end

  # GET /recipe_ingredients/1/edit
  def edit
  end

  # POST /recipe_ingredients
  def create
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)

    if @recipe_ingredient.save
      redirect_to @recipe_ingredient, notice: "Recipe ingredient was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipe_ingredients/1
  def update
    if @recipe_ingredient.update(recipe_ingredient_params)
      redirect_to @recipe_ingredient, notice: "Recipe ingredient was successfully updated.",
                                      status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /recipe_ingredients/1
  def destroy
    @recipe_ingredient.destroy!
    redirect_to recipe_ingredients_url, notice: "Recipe ingredient was successfully destroyed.",
                                        status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_ingredient
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_ingredient_params
    params.fetch(:recipe_ingredient, {})
  end
end
