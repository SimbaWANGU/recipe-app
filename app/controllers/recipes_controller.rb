class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @quantity = RecipeFood.find_by(recipe_id: params[:id]).quantity
    @price = Food.find_by(id: RecipeFood.find_by(recipe_id: params[:id]).food_id).price
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(articles_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def articles_params
    params.require(:article).permit(:title, :content)
  end
end
