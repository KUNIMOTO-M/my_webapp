require 'rails_helper'

RSpec.describe "Creates", type: :request do

  describe "GET /destroy" do
    it "returns http success" do
      get "/create/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/create/index"
      expect(response).to have_http_status(:success)
    end
  end

end
