class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :informations, -> { order(open_date: :asc, close_date: :asc) }, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :customers, through: :relationships # followingに修正
  has_many :coupons, -> { order(using_period: :asc) }, dependent: :destroy
  has_many :notifications, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true
  validates :address, presence: true
  validates :telphone_number, presence: true

  # ゲストオーナーの生成
  def self.guest
    find_or_create_by!(name: 'Guest_owner', email: 'guest@example.com') do |owner|
      owner.address = '岐阜県'
      owner.telphone_number = '0000000000'
      owner.password = SecureRandom.urlsafe_base64
    end
  end

  # デフォルト画像の保存
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/test_owner.png')
      image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    image
  end

  # テイクアウト営業しているか判定
  def today_open?
    return true unless informations.today_is_valid.length == 0
  end
end
