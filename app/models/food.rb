class Food < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :recipes, through: :recipe_foods, dependent: :delete_all
end
