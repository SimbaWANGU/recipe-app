# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: "Albert")
first_food = Food.create(name: "Apple", measurement_unit: "Ounces", price: 10, quantity: 5, user_id: first_user.id)
first_recipe = Recipe.create(name: "Apple Pie", preparation_time: 30, cooking_time: 60, description: "A delicious apple pie", public: true, user_id: first_user.id)
first_recipe_food = RecipeFood.create(quantity: 5, recipe_id: first_recipe.id, food_id: first_food.id)