class RecipeIngredientsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(params[:ingredient_id])
    @ingredients = @recipe.ingredients
  end

  
end