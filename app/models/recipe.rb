class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :food, through: :recipe_foods
  has_many :recipe_foods, dependent: :destroy
end
