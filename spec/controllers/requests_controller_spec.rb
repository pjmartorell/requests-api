require 'rails_helper'

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

RSpec.describe RequestsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Request. As you add validations to Request, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      "amount"=>50,
      "days"=>10,
      "email"=>"email@domain.es",
      "dni"=>"92795349D",
      "cellphone"=>"11111-111-1111"
    }
  }

  let(:invalid_attributes) {
    {
      "amount"=>-1,
      "days"=>100,
      "email"=>"email@domain",
      "dni"=>"92795349E",
      "cellphone"=>"1111-111-1111"
    }
  }

  before(:each) do
    allow_any_instance_of(RequestsController).to receive(:raise_unexpected_exception)
  end

  describe "GET index" do
    it "assigns all requests as @requests" do
      request = Request.create! valid_attributes
      get :index, params: {}
      expect(assigns(:requests)).to eq([request])
      expect(response).to be_success
    end
  end

  describe "GET show" do
    it "assigns the requested request as @request" do
      request = Request.create! valid_attributes
      get :show, params: {:id => request.to_param}
      expect(assigns(:request)).to eq(request)
      expect(response).to be_success
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Request" do
        expect {
          post :create, params: {:request => valid_attributes}
        }.to change(Request, :count).by(1)
      end

      it "assigns a newly created request as @request" do
        post :create, params: {:request => valid_attributes}
        expect(assigns(:request)).to be_a(Request)
        expect(assigns(:request)).to be_persisted
      end

      it "returns the created request" do
        post :create, params: {:request => valid_attributes}
        expect(response.body).to eq(Request.last.to_json)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved request as @request" do
        post :create, params: {:request => invalid_attributes}
        expect(assigns(:request)).to be_a_new(Request)
        expect(response).to be_unprocessable
      end
    end

    context "when an unexpected exception raises" do
      before do
        allow_any_instance_of(RequestsController).to receive(:raise_unexpected_exception).and_raise("Out of service!")
      end

      it "rolls back the created request" do
        expect do
          post :create, params: {:request => invalid_attributes}
          expect(assigns(:request)).to be_a_new(Request)
          expect(assigns(:request)).to not_be_persisted
          expect(response).to be_server_error
        end.to raise_error(RuntimeError)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {
          "amount"=>500,
          "days"=>20,
          "email"=>"john@doe.com",
          "dni"=>"92795349D",
          "cellphone"=>"11111-111-1111"
        }
      }

      it "updates the requested request" do
        request = Request.create! valid_attributes
        put :update, params: {:id => request.to_param, :request => new_attributes}
        request.reload
        expect(request.email).to eq("john@doe.com")
      end

      it "assigns the requested request as @request" do
        request = Request.create! valid_attributes
        put :update, params: {:id => request.to_param, :request => valid_attributes}
        expect(assigns(:request)).to eq(request)
      end

      it "returns a 200 http status" do
        request = Request.create! valid_attributes
        put :update, params: {:id => request.to_param, :request => valid_attributes}
        expect(response).to be_success
      end
    end

    describe "with invalid params" do
      it "assigns the request as @request" do
        request = Request.create! valid_attributes
        put :update, params: {:id => request.to_param, :request => invalid_attributes}
        expect(assigns(:request)).to eq(request)
        expect(response).to be_unprocessable
      end
    end

    context "when an unexpected exception raises" do
      before do
        allow_any_instance_of(RequestsController).to receive(:raise_unexpected_exception).and_raise("Out of service!")
      end

      it "rolls back the updated request" do
        request = Request.create! valid_attributes
        expect do
          put :update, params: {:id => request.to_param, :request => invalid_attributes}
          expect(assigns(:request)).to not_be_persisted
          expect(response).to be_server_error
        end.to raise_error(RuntimeError)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested request" do
      request = Request.create! valid_attributes
      expect {
        delete :destroy, params: {:id => request.to_param}
      }.to change(Request, :count).by(-1)
    end

    it "returns nothing" do
      request = Request.create! valid_attributes
      delete :destroy, params: {:id => request.to_param}
      expect(response).to be_no_content
    end
  end

end
