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
    @recipe = Recipe.new(recipes_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @recipe.update(recipes_params)
      redirect_to recipes_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  def public_recipes
    @public_recipe = Recipe.where(public: 'true').includes(:recipe_foods).order(updated_at: :desc)
  end

  private

  def recipes_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
