require "spec_helper"

describe TypeOfIngredientsController do
  describe "routing" do

    it "routes to #index" do
      get("/type_of_ingredients").should route_to("type_of_ingredients#index")
    end

    it "routes to #new" do
      get("/type_of_ingredients/new").should route_to("type_of_ingredients#new")
    end

    it "routes to #show" do
      get("/type_of_ingredients/1").should route_to("type_of_ingredients#show", :id => "1")
    end

    it "routes to #edit" do
      get("/type_of_ingredients/1/edit").should route_to("type_of_ingredients#edit", :id => "1")
    end

    it "routes to #create" do
      post("/type_of_ingredients").should route_to("type_of_ingredients#create")
    end

    it "routes to #update" do
      put("/type_of_ingredients/1").should route_to("type_of_ingredients#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/type_of_ingredients/1").should route_to("type_of_ingredients#destroy", :id => "1")
    end

  end
end
