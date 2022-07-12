class Notification < ApplicationRecord
  belongs_to :customer
  belongs_to :owner
  belongs_to :coupon, optional: true
  belongs_to :information, optional: true

  # クーポン:0, テイクアウト営業情報:1
  enum category: {
    coupon_notice: 0,
    information_notice: 1
  }
end
