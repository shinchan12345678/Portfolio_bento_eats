class Batch::CouponDelete
  def self.couponDelete
    coupons_is_invalid = Coupon.where("using_period < ?", Date.current)
    coupons_is_invalid.each do |coupon|
      coupon.destroy
    end
  end
end
