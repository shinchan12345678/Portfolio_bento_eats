class Owner::CouponsController < Owner::ApplicationController
  def index
  end

  def new
    @coupon = Coupon.new
  end
  
  def confirm
    @coupon = Coupon.new(coupon_params)
  end

  def create
    current_owner.coopon_create(coupon_params)
    redirect_to owner_coupons_path
  end

  private

  def coupon_params
    params.require(:coupon).permit(:discount, :using_period, :condition)
  end
end
