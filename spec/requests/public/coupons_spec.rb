require 'rails_helper'

RSpec.describe "Public::Coupons", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/public/coupons/index"
      expect(response).to have_http_status(:success)
    end
  end
end
