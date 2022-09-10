class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = @user&.recipe
  end

  def public_recipes
    @public_recipes = Recipe.includes(:user).all.where(public: true).order(created_at: :desc)
    render :public_recipes
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.create(
      name: params[:name],
      preparation_time: params[:prepration_time],
      cooking_time: params[:cooking_time], 
      description: params[:description], 
      public: params[:public], 
      user_id: current_user.id
    )
    puts recipe.name, recipe.preparation_time, recipe.cooking_time, recipe.description, recipe.public, recipe.user_id, recipe.valid?
    if recipe.save
      redirect_to recipes_path, notice: 'Recipe created successfully!'
    else
      render new, status: :unprocessable_entity, alert: 'An error has occurred while creating the new recipe'
    end
  end

  def update
    if @recipe.update(recipes_params)
      redirect_to recipes_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  # GET /recipes/1 or /recipes/1.json
  def show; end

  def delete
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe deleted Successfully'
    else
      redirect_to root, alert: 'Could not delete recipe'
    end
  end

  def shopping_list
    @recipe_shopping = Recipe.find(params[:id]).recipe_foods
    @food = []
    @recipe_shopping.ids.each do |id|
      @food.push(Food.find_by(id:))
    end
    @user_food = current_user.food
    @comparison_food = custom_difference(@food, @user_food)
    @food.each do |a|
      puts a.name
    end
    puts 'hello'
    @user_food.each do |a|
      puts a.name
    end
    same_food_result = same_food(@food, @user_food)
    if same_food_result.zero?
      @comparison_food
    else
      @comparison_food.append(same_food(@food, @user_food))
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end

  def custom_difference(all, subset)
    all.select do |all_curr|
      subset.find do |subset_curr|
        subset_curr.name == all_curr.name
      end.nil?
    end
  end

  def same_food(_food, _user_food)
    @comparis_food = []
    @user_food.each do |uf|
      @food.each do |rf|
        next unless uf.name == rf.name
        next if (uf.quantity - rf.quantity).zero?

        uf.quantity = uf.quantity - rf.quantity
        @comparis_food.push(uf)
      end
    end
    if @comparis_food.count.zero?
      0
    else
      @comparis_food
    end
  end
end
