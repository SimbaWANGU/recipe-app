class RecipesController < ApplicationController
  def public_recipes
    @public_recipe = Recipe.where(public: "true").includes(:recipe_foods).order(updated_at: :desc)
  end
end
