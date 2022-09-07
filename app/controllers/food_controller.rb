class FoodController < ApplicationController
  def index
    @all_food = Food.all
  end

  def delete
    @food_to_delete = Food.find(params[:id])
    @food_to_delete.destroy
    redirect_to food_path
  end
end
