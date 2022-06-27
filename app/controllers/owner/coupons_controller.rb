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
    # rubocop:disable Lint/AssignmentInCondition
    if coupons = current_owner.coupons.maximum(:group_id) # ユニークなグループ番号を生成する
      counter = coupons + 1
    else
      counter = 0
    end
    result = "OK"
    current_owner.customers.each do |customer|
      @coupon = current_owner.coupons.new(coupon_params)
      @coupon.group_id = counter
      @coupon.customer_id = customer.id
      unless @coupon.save
        result = "NG"
        break
      end
    end
    if result == "OK"
      redirect_to owner_coupons_path, notice: "クーポンを発行しました"
    else
      render :new
    end
    # rubocop:enable Lint/AssignmentInCondition
  end

  private

  def coupon_params
    params.require(:coupon)[:discount] = params.require(:coupon)[:discount].to_i
    params.require(:coupon).permit(:discount, :using_period, :condition)
  end

  def follower_exist?
    redirect_to owner_owners_path if current_owner.customers.size == 0
  end
end
