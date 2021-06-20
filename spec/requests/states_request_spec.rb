require 'rails_helper'

RSpec.describe "States", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/states/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/states/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
