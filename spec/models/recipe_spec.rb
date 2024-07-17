require "rails_helper"

RSpec.describe Recipe, type: :model do
  
  describe "relationships" do
    it {should have_many :ingredients}
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

end