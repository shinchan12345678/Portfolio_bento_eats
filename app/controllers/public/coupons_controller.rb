class Public::CouponsController < ApplicationController
  def index
    @coupons = current_customer.coupons.where("using_period >= ?", Date.current)
  end

  def update
    Coupon.find(params[:id]).update(is_valid: 1)
    redirect_to coupons_path,notice: "クーポンを使用すみに変更しました"
  end
end
