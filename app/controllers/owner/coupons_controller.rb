class Owner::CouponsController < Owner::ApplicationController
  def index
  end

  def new
    @coupon = Coupon.new
  end
end
