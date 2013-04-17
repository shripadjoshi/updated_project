require 'spec_helper'

describe "type_of_ingredients/new" do
  before(:each) do
    assign(:type_of_ingredient, stub_model(TypeOfIngredient,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new type_of_ingredient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => type_of_ingredients_path, :method => "post" do
      assert_select "input#type_of_ingredient_name", :name => "type_of_ingredient[name]"
    end
  end
end
