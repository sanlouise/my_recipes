require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(name: "bob", email: "bobby@example.com")
    @recipe = @chef.recipes.build(name: "Veggie awesome", summary: "Best veggie salad ever!", description: "Add all wonderul ingredients! Include tomatoes and onions. Cook for 20 minutes.")
  end
  
  test "Recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "Recipe has chef id present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "Name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "Correct name length (not too long)" do
    @recipe.name = "a" * 51
    assert_not @recipe.valid?
  end
  
  test "Correct name length (not too short)" do
    @recipe.name = "a"
    assert_not @recipe.valid?
  end
  
  test "Summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "Summary length (not too long)" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test "Summary length (not too short)" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end
  
  test "Description must be present" do
   @recipe.description = " "
   assert_not @recipe.valid?
  end
  
  test "Description (not too long)" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
  
  test "Description (not too short)" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end
  
end