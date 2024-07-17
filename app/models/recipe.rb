class Recipe < ApplicationRecord
   has_many :ingredients
   has_many :recipe_ingredients
   has_many :ingredients, through: :recipe_ingredients

   validates :name, :complexity, :genre, presence: true  

   def cost
      @ingredients.cost.total
   end
end
