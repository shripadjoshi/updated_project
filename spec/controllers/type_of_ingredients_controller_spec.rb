require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TypeOfIngredientsController do

  # This should return the minimal set of attributes required to create a valid
  # TypeOfIngredient. As you add validations to TypeOfIngredient, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TypeOfIngredientsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all type_of_ingredients as @type_of_ingredients" do
      type_of_ingredient = TypeOfIngredient.create! valid_attributes
      get :index, {}, valid_session
      assigns(:type_of_ingredients).should eq([type_of_ingredient])
    end
  end

  describe "GET show" do
    it "assigns the requested type_of_ingredient as @type_of_ingredient" do
      type_of_ingredient = TypeOfIngredient.create! valid_attributes
      get :show, {:id => type_of_ingredient.to_param}, valid_session
      assigns(:type_of_ingredient).should eq(type_of_ingredient)
    end
  end

  describe "GET new" do
    it "assigns a new type_of_ingredient as @type_of_ingredient" do
      get :new, {}, valid_session
      assigns(:type_of_ingredient).should be_a_new(TypeOfIngredient)
    end
  end

  describe "GET edit" do
    it "assigns the requested type_of_ingredient as @type_of_ingredient" do
      type_of_ingredient = TypeOfIngredient.create! valid_attributes
      get :edit, {:id => type_of_ingredient.to_param}, valid_session
      assigns(:type_of_ingredient).should eq(type_of_ingredient)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TypeOfIngredient" do
        expect {
          post :create, {:type_of_ingredient => valid_attributes}, valid_session
        }.to change(TypeOfIngredient, :count).by(1)
      end

      it "assigns a newly created type_of_ingredient as @type_of_ingredient" do
        post :create, {:type_of_ingredient => valid_attributes}, valid_session
        assigns(:type_of_ingredient).should be_a(TypeOfIngredient)
        assigns(:type_of_ingredient).should be_persisted
      end

      it "redirects to the created type_of_ingredient" do
        post :create, {:type_of_ingredient => valid_attributes}, valid_session
        response.should redirect_to(TypeOfIngredient.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved type_of_ingredient as @type_of_ingredient" do
        # Trigger the behavior that occurs when invalid params are submitted
        TypeOfIngredient.any_instance.stub(:save).and_return(false)
        post :create, {:type_of_ingredient => { "name" => "invalid value" }}, valid_session
        assigns(:type_of_ingredient).should be_a_new(TypeOfIngredient)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        TypeOfIngredient.any_instance.stub(:save).and_return(false)
        post :create, {:type_of_ingredient => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested type_of_ingredient" do
        type_of_ingredient = TypeOfIngredient.create! valid_attributes
        # Assuming there are no other type_of_ingredients in the database, this
        # specifies that the TypeOfIngredient created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        TypeOfIngredient.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => type_of_ingredient.to_param, :type_of_ingredient => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested type_of_ingredient as @type_of_ingredient" do
        type_of_ingredient = TypeOfIngredient.create! valid_attributes
        put :update, {:id => type_of_ingredient.to_param, :type_of_ingredient => valid_attributes}, valid_session
        assigns(:type_of_ingredient).should eq(type_of_ingredient)
      end

      it "redirects to the type_of_ingredient" do
        type_of_ingredient = TypeOfIngredient.create! valid_attributes
        put :update, {:id => type_of_ingredient.to_param, :type_of_ingredient => valid_attributes}, valid_session
        response.should redirect_to(type_of_ingredient)
      end
    end

    describe "with invalid params" do
      it "assigns the type_of_ingredient as @type_of_ingredient" do
        type_of_ingredient = TypeOfIngredient.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TypeOfIngredient.any_instance.stub(:save).and_return(false)
        put :update, {:id => type_of_ingredient.to_param, :type_of_ingredient => { "name" => "invalid value" }}, valid_session
        assigns(:type_of_ingredient).should eq(type_of_ingredient)
      end

      it "re-renders the 'edit' template" do
        type_of_ingredient = TypeOfIngredient.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TypeOfIngredient.any_instance.stub(:save).and_return(false)
        put :update, {:id => type_of_ingredient.to_param, :type_of_ingredient => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested type_of_ingredient" do
      type_of_ingredient = TypeOfIngredient.create! valid_attributes
      expect {
        delete :destroy, {:id => type_of_ingredient.to_param}, valid_session
      }.to change(TypeOfIngredient, :count).by(-1)
    end

    it "redirects to the type_of_ingredients list" do
      type_of_ingredient = TypeOfIngredient.create! valid_attributes
      delete :destroy, {:id => type_of_ingredient.to_param}, valid_session
      response.should redirect_to(type_of_ingredients_url)
    end
  end

end