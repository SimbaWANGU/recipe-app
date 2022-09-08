class FoodController < ApplicationController
  def index
    @all_food = Food.all
  end

  def new
    @new_food = Food.new
  end

  def create
    @new_food = Food.create(name: params[:name], measurement_unit: params[:measurement_unit], price: params[:price],
                            quantity: params[:quantity], user_id: current_user.id)
    @new_food.save
    redirect_to foods_path
  end

  def delete
    @food_to_delete = Food.find(params[:id])
    @food_to_delete.destroy
    redirect_to foods_path
  end
end
