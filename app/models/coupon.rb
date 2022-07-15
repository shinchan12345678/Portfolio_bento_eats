class Coupon < ApplicationRecord
  belongs_to :customer
  belongs_to :owner
  has_many :notifications, dependent: :destroy

  has_one_attached :image

  validates :customer_id, presence: true
  validates :owner_id, presence: true
  validates :group_id, presence: true
  validates :discount, presence: true
  validates :is_valid, presence: true
  validates :using_period, presence: true

  def get_image
    unless image.attached?
      case discount
      when "fifty" then
        file_path = Rails.root.join('app/assets/images/coupon_0.png')
        image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
      when "one_hundred" then
        file_path = Rails.root.join('app/assets/images/coupon_1.png')
        image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
      when "one_hundred_fifty" then
        file_path = Rails.root.join('app/assets/images/coupon_2.png')
        image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
      when "two_hundred" then
        file_path = Rails.root.join('app/assets/images/coupon_3.png')
        image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
      end
    end
    image
  end

  # クーポン発行の通知を作成
  def create_notification
    notification = Notification.new(customer_id: customer_id, owner_id: owner_id, coupon_id: id, category: 0, is_checked: false)
    notification.save if notification.valid?
  end

  # 有効:0, 無効:1
  enum is_valid: {
    before_use: 0,
    after_use: 1
  }

  # 50円:0, 100円:1, 150円:2, 200円:3
  enum discount: {
    fifty: 0,
    one_hundred: 1,
    one_hundred_fifty: 2,
    two_hundred: 3
  }
end
