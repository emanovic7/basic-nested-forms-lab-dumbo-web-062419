class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(quantity: "200")
  end

  def create
    # byebug
    recipe = Recipe.create(recipe_params)
    redirect_to recipe_path(recipe)
  end

  private

    def recipe_params
      params.require(:recipe).permit(
        :name,
        ingredients_attributes: [
          :name,
          :quantity
        ]
      )
    end


end
