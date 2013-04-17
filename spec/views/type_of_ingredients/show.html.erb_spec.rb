require 'spec_helper'

describe "type_of_ingredients/show" do
  before(:each) do
    @type_of_ingredient = assign(:type_of_ingredient, stub_model(TypeOfIngredient,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
