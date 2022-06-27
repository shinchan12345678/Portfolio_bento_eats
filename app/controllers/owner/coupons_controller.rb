class Owner::CouponsController < Owner::ApplicationController
  def index
    @coupons = Coupon.all
  end

  def new
    @coupon = Coupon.new
  end

  def confirm
    @coupon = Coupon.new(coupon_params)
  end

  def create
    coupon = current_owner.coupons.new(coupon_params)
    current_owner.coopon_create(coupon)
    redirect_to owner_coupons_path
  end

  private

  def coupon_params
    params.require(:coupon)[:discount] = params.require(:coupon)[:discount].to_i
    params.require(:coupon).permit(:discount, :using_period, :condition)
  end
end
