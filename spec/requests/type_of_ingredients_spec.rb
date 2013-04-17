require 'spec_helper'

describe "TypeOfIngredients" do
  describe "GET /type_of_ingredients" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get type_of_ingredients_path
      response.status.should be(200)
    end
  end
end
