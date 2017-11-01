require 'test_helper'

describe EdamamApiWrapper do
  it "Can list a group of recipes" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.list_recipes("apple")
      recipes.must_be_instance_of Array
      recipes.length.must_be :>, 0
      recipes.each do |recipe|
        recipe.must_be_instance_of Recette
      end
    end
  end
  it "return [] for a broken request" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.list_recipes("apple", "BOGUS", "SUPERBOGUUUUS")
      recipes.must_equal false

    end
  end
end
