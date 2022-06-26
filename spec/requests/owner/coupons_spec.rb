require 'rails_helper'

RSpec.describe "Owner::Coupons", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/owner/coupons/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/owner/coupons/new"
      expect(response).to have_http_status(:success)
    end
  end

end
