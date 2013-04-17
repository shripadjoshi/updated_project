require 'spec_helper'

describe "type_of_ingredients/edit" do
  before(:each) do
    @type_of_ingredient = assign(:type_of_ingredient, stub_model(TypeOfIngredient,
      :name => "MyString"
    ))
  end

  it "renders the edit type_of_ingredient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => type_of_ingredients_path(@type_of_ingredient), :method => "post" do
      assert_select "input#type_of_ingredient_name", :name => "type_of_ingredient[name]"
    end
  end
end
