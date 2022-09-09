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

  def edit
    @recipe = Recipe.find(params[:id])
  end

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

  def shopping_list
    @recipe_shopping = Recipe.find(params[:id]).recipe_foods
    @food = []
    @recipe_shopping.ids.each do |id|
      @food.push(Food.find_by(id: id))
    end
    @user_food = current_user.food
    @comparison_food = custom_difference(@food, @user_food)
    same_food_result = same_food(@food, @user_food)
    if same_food_result == 0 
      return @comparison_food
    else
      @comparison_food.append(same_food(@food, @user_food))
    end
  end

  private

  def recipes_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end

  def custom_difference(all, subset)
    diff = all.reject { |all_curr|
      subset.find{ |subset_curr|
        subset_curr.name == all_curr.name
      } != nil
    }
  end

  def same_food(food, user_food)
    @comparis_food = []
    @user_food.each do |uf|
      @food.each do |rf|
        if uf.name == rf.name
          if (uf.quantity - rf.quantity) == 0
            next
          else
            uf.quantity = (uf.quantity - rf.quantity).abs
            @comparis_food.push(uf)
          end
        end
      end
    end
    unless @comparis_food.count == 0 
      return @comparis_food
    else
      return 0
    end
  end
end
