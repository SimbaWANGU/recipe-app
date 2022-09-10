# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: "Mustard")
second_user = User.create(name: "Emmz")

first_user_food_1 = Food.create(name: "Cheese", measurement_unit: "Ounces", price: 10, quantity: 5, user_id: first_user.id)
first_user_food_2 = Food.create(name: "Salt", measurement_unit: "Grams", price: 100, quantity: 50, user_id: first_user.id)
first_user_food_3 = Food.create(name: "Bell Pepper", measurement_unit: "Kilograms", price: 500, quantity: 1, user_id: first_user.id)
first_user_food_4 = Food.create(name: "Water", measurement_unit: "Litre", price: 250, quantity: 2, user_id: first_user.id)
first_user_food_5 = Food.create(name: "Mayonnaise", measurement_unit: "Kilograms", price: 500, quantity: 1, user_id: first_user.id)
first_user_food_6 = Food.create(name: "Tomatoes", measurement_unit: "Kilograms", price: 500, quantity: 1, user_id: first_user.id)
first_user_food_7 = Food.create(name: "Onions", measurement_unit: "Kilograms", price: 500, quantity: 1, user_id: first_user.id)

second_user_food_1 = Food.create(name: "Arrow Roots", measurement_unit: "Ounces", price: 10, quantity: 5, user_id: second_user.id)
second_user_food_2 = Food.create(name: "Cumin", measurement_unit: "Grams", price: 2, quantity: 200, user_id: second_user.id)
second_user_food_3 = Food.create(name: "Garlic", measurement_unit: "Grams", price: 10, quantity: 100, user_id: second_user.id)


first_recipe = Recipe.create(name: "Pizza", preparation_time: 30, cooking_time: 60, description: "A delicious pizza", public: true, user_id: first_user.id)
second_recipe = Recipe.create(name: "Beef", preparation_time: 30, cooking_time: 60, description: "A delicious meat dish", public: true, user_id: second_user.id)
#second_recipe = Recipe.create(name: "Orange Pie", preparation_time: 30, cooking_time: 60, description: "A delicious apple pie", public: false, user_id: first_user.id)
#third_recipe = Recipe.create(name: "Watermelon Pie", preparation_time: 30, cooking_time: 60, description: "A delicious apple pie", public: false, user_id: first_user.id)
#fourth_recipe = Recipe.create(name: "Pineapple Pie", preparation_time: 30, cooking_time: 60, description: "A delicious apple pie", public: true, user_id: first_user.id)
#fifth_recipe = Recipe.create(name: "Grape Pie", preparation_time: 30, cooking_time: 60, description: "A delicious apple pie", public: true, user_id: first_user.id)
first_recipe_food_1 = RecipeFood.create(quantity: 5, recipe_id: first_recipe.id, food_id: first_user_food_1.id)
first_recipe_food_2 = RecipeFood.create(quantity: 5, recipe_id: first_recipe.id, food_id: first_user_food_2.id)
first_recipe_food_3 = RecipeFood.create(quantity: 5, recipe_id: first_recipe.id, food_id: first_user_food_3.id)
first_recipe_food_4 = RecipeFood.create(quantity: 5, recipe_id: first_recipe.id, food_id: first_user_food_4.id)
first_recipe_food_5 = RecipeFood.create(quantity: 5, recipe_id: first_recipe.id, food_id: first_user_food_5.id)
first_recipe_food_6 = RecipeFood.create(quantity: 5, recipe_id: first_recipe.id, food_id: first_user_food_6.id)
first_recipe_food_7  = RecipeFood.create(quantity: 5, recipe_id: first_recipe.id, food_id: first_user_food_7.id)

second_recipe_food_1 = RecipeFood.create(quantity: 5, recipe_id: second_recipe.id, food_id: second_user_food_1.id)
second_recipe_food_2 = RecipeFood.create(quantity: 5, recipe_id: second_recipe.id, food_id: second_user_food_2.id)
second_recipe_food_3 = RecipeFood.create(quantity: 5, recipe_id: second_recipe.id, food_id: first_user_food_3.id)
second_recipe_food_4 = RecipeFood.create(quantity: 5, recipe_id: second_recipe.id, food_id: first_user_food_4.id)
second_recipe_food_5 = RecipeFood.create(quantity: 5, recipe_id: second_recipe.id, food_id: first_user_food_5.id)
second_recipe_food_6 = RecipeFood.create(quantity: 5, recipe_id: second_recipe.id, food_id: first_user_food_6.id)
second_recipe_food_7 = RecipeFood.create(quantity: 5, recipe_id: second_recipe.id, food_id: first_user_food_7.id)