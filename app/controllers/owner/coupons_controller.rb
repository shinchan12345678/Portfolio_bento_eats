class Owner::CouponsController < Owner::ApplicationController
  before_action :follower_exist?, only: [:create]

  def index
    # グループIDごとに１クーポンのみ表示
    @coupons = []
    current_owner.coupons.distinct.pluck(:group_id).each do |group|
      @coupons.push(Coupon.find_by(owner_id: current_owner.id, group_id: group))
    end
  end

  def new
    @coupon = Coupon.new
  end

  def confirm
    @coupon = Coupon.new(coupon_params)
  end

  def create
    coupon = current_owner.coupons.new(coupon_params)
    current_owner.coupon_create(coupon)
    redirect_to owner_coupons_path
  end

  private

  def coupon_params
    params.require(:coupon)[:discount] = params.require(:coupon)[:discount].to_i
    params.require(:coupon).permit(:discount, :using_period, :condition)
  end

  def follower_exist?
    redirect_to owner_owners_path if customers.length == 0
  end
end
