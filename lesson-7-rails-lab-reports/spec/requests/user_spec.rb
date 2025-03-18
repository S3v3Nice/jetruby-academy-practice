require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }
  let(:valid_params) { { user: attributes_for(:user) } }
  let(:invalid_params) { { user: { email: "invalid-email" } } }

  describe "GET /users" do
    it "returns a successful response" do
      get users_url
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Users")
    end
  end

  describe "GET /users/:id" do
    it "returns a successful response" do
      get user_url(user)
      expect(response).to have_http_status(:success)
      expect(response.body).to include(user.full_name)
    end
  end

  describe "POST /users" do
    context "with valid parameters" do
      it "creates a new user and redirects" do
        expect {
          post users_url, params: valid_params
        }.to change(User, :count).by(1)

        expect(response).to redirect_to(users_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new user and renders errors" do
        expect {
          post users_url, params: invalid_params
        }.not_to change(User, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("Email is invalid")
      end
    end
  end

  describe "PATCH /users/:id" do
    context "with valid parameters" do
      it "updates the user and redirects" do
        patch user_url(user), params: { user: { first_name: "Updated Name" } }
        expect(response).to redirect_to(user_url(user))
        user.reload
        expect(user.first_name).to eq("Updated Name")
      end
    end

    context "with invalid parameters" do
      it "does not update the user and renders errors" do
        patch user_url(user), params: { user: { email: "invalid-email" } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("Email is invalid")
      end
    end
  end

  describe "DELETE /users/:id" do
    it "deletes the user and redirects" do
      user
      expect {
        delete user_url(user)
      }.to change(User, :count).by(-1)

      expect(response).to redirect_to(users_url)
    end

    context "with non-existing user" do
      it "returns an error message" do
        expect {
          delete user_url(id: 999)
        }.not_to change(User, :count)

        expect(response).to have_http_status(:not_found)
        expect(response.body).to include("User not found")
      end
    end
  end
end
