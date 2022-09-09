# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: "Mustard")

first_food = Food.create(name: "Cheese", measurement_unit: "Ounces", price: 10, quantity: 5, user_id: first_user.id)
second_food = Food.create(name: "Salt", measurement_unit: "Grams", price: 100, quantity: 50, user_id: first_user.id)
third_food = Food.create(name: "Bell Pepper", measurement_unit: "Kilograms", price: 500, quantity: 1, user_id: first_user.id)
fourth_food = Food.create(name: "Water", measurement_unit: "Litre", price: 250, quantity: 2, user_id: first_user.id)
fifth_food = Food.create(name: "Mayonnaise", measurement_unit: "Kilograms", price: 500, quantity: 1, user_id: first_user.id)
sixth_food = Food.create(name: "Tomatoes", measurement_unit: "Kilograms", price: 500, quantity: 1, user_id: first_user.id)
seventh_food = Food.create(name: "Onions", measurement_unit: "Kilograms", price: 500, quantity: 1, user_id: first_user.id)


first_recipe = Recipe.create(name: "Pizza", preparation_time: 30, cooking_time: 60, description: "A delicious pizza", public: true, user_id: first_user.id)
#second_recipe = Recipe.create(name: "Orange Pie", preparation_time: 30, cooking_time: 60, description: "A delicious apple pie", public: false, user_id: first_user.id)
#third_recipe = Recipe.create(name: "Watermelon Pie", preparation_time: 30, cooking_time: 60, description: "A delicious apple pie", public: false, user_id: first_user.id)
#fourth_recipe = Recipe.create(name: "Pineapple Pie", preparation_time: 30, cooking_time: 60, description: "A delicious apple pie", public: true, user_id: first_user.id)
#fifth_recipe = Recipe.create(name: "Grape Pie", preparation_time: 30, cooking_time: 60, description: "A delicious apple pie", public: true, user_id: first_user.id)
first_recipe_food = RecipeFood.create(quantity: 5, recipe_id: first_recipe.id, food_id: first_food.id)
second_recipe_food = RecipeFood.create(quantity: 5, recipe_id: first_recipe.id, food_id: second_food.id)
third_recipe_food = RecipeFood.create(quantity: 5, recipe_id: first_recipe.id, food_id: third_food.id)
fourth_recipe_food = RecipeFood.create(quantity: 5, recipe_id: first_recipe.id, food_id: fourth_food.id)
fifth_recipe_food = RecipeFood.create(quantity: 5, recipe_id: first_recipe.id, food_id: fifth_food.id)
sixth_recipe_food = RecipeFood.create(quantity: 5, recipe_id: first_recipe.id, food_id: sixth_food.id)
seventh_recipe_food = RecipeFood.create(quantity: 5, recipe_id: first_recipe.id, food_id: seventh_food.id)