require 'rails_helper'
# User Story 2

RSpec.describe "Recipes Show:" do
  before :each do
    dish_1 = Recipe.create!(name: "Yummy Yum For Your Tummy Tum", complexity: 9, genre: "Classical French")
    dish_2 = Recipe.create!(name: "A Treat Made of Feet", complexity: 1, genre: "Coastal Italian")
    dish_3 = Recipe.create!(name: "Celery Ramen", complexity: 10, genre: "Japanese-ish")
    mystery_meat = dish_1.ingredients.create!(name: "Mystery Meat", cost: 69)
    root_veg = dish_1.ingredients.create!(name: "Miscellaneous Root Vegetables", cost: 666)
    greens = dish_1.ingredients.create!(name: "Kind Greens", cost: 420)
    onions = dish_1.ingredients.create!(name: "Onions", cost: 20)
    butter = dish_1.ingredients.create!(name: "BUTTER", cost: 666)
  end
  describe "As a visitor:" do
    describe "When I visit '/recipes/:id'" do
      it "I see the recipe's name, complexity and genre," do
        visit "/recipes/#{recipe_1.id}"

        expect(page).to have_content(dish_1.name)
        expect(page).to_not have_content(dish_2.name)
        expect(page).to_not have_content(dish_3.name)

        expect(page).to have_content(dish_1.complexity)
        expect(page).to_not have_content(dish_2.complexity)
        expect(page).to_not have_content(dish_3.complexity)
        
        expect(page).to have_content(dish_1.genre)
        expect(page).to_not have_content(dish_2.genre)
        expect(page).to_not have_content(dish_3.genre)
      end
      it "I see a list of the names of the ingredients for the recipe" do
        visit "/recipes/#{recipe_1.id}"

        expect(page).to have_content(dish_1.ingredients)
        expect(page).to_not have_content(dish_2.ingredients)
        expect(page).to_not have_content(dish_3.ingredients)
      end
    end
  end

  describe "As a visitor:" do
    describe "When I visit '/recipes/:id'" do
      it "I see the total cost of all of the ingredients in the recipe." do
        expect(page).to have_content(dish_1.cost)
        expect(page).to_not have_content(dish_2.cost)
        expect(page).to_not have_content(dish_3.cost)
      end
    end
  end
end
