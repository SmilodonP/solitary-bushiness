require 'rails_helper'

# User Story 1 - Ingredients Index
RSpec.describe "Ingredients Index:" do
  before :each do
    dish_1 = Recipe.create!(name: "Yummy Yum For Your Tummy Tum", complexity: 9, genre: "Classical French")
    mystery_meat = dish_1.ingredients.create!(name: "Mystery Meat", cost: 69)
    root_veg = dish_1.ingredients.create!(name: "Miscellaneous Root Vegetables", cost: 666)
    greens = dish_1.ingredients.create!(name: "Kind Greens", cost: 420)
    onions = dish_1.ingredients.create!(name: "Onions", cost: 20)
    butter = dish_1.ingredients.create!(name: "BUTTER", cost: 666)
  end
  
  describe "As a visitor:" do
    describe "When I visit '/ingredients'" do
      it "I see a list of all the ingredients including their name and cost" do
        visit "/ingredients"
        
        expect(page).to have_content(mystery_meat.name)
        expect(page).to have_content(mystery_meat.cost)

        expect(page).to have_content(root_veg.name)
        expect(page).to have_content(root_veg.cost)

        expect(page).to have_content(greens.name)
        expect(page).to have_content(greens.cost)
        
        expect(page).to have_content(onions.name)
        expect(page).to have_content(onions.cost)
        
        expect(page).to have_content(butter.name)
        expect(page).to have_content(butter.cost)
      end
    end
  end
end