require 'spec_helper'

describe "type_of_ingredients/index" do
  before(:each) do
    assign(:type_of_ingredients, [
      stub_model(TypeOfIngredient,
        :name => "Name"
      ),
      stub_model(TypeOfIngredient,
        :name => "Name"
      )
    ])
  end

  it "renders a list of type_of_ingredients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
