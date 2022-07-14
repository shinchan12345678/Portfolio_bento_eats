class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  validates :nickname, presence: true

  has_many :relationships, dependent: :destroy
  has_many :owners, through: :relationships
  has_many :favorites, dependent: :destroy
  has_many :items, through: :favorites
  has_many :comments, dependent: :destroy
  has_many :coupons, -> { order(using_period: :asc) }, dependent: :destroy
  has_many :notifications, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :sns_credentials, dependent: :destroy

  # 管理者用のユーザーの生成
  def self.admin
    find_or_create_by!(nickname: "Admin", email: 'admin@example.com') do |admin|
      admin.password = SecureRandom.urlsafe_base64
    end
  end

  # ゲストユーザーの生成
  def self.guest
    find_or_create_by!(nickname: 'Guest', email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
    end
  end

  # 飲食店をフォローする
  def follow(owner)
    relationships.create(owner_id: owner.id)
  end

  # 飲食店のフォローを外す
  def unfollow(owner)
    relationships.find_by(owner_id: owner.id).destroy
  end

  # フォロー済みの確認
  def following?(owner)
    owners.include?(owner)
  end

  # 商品をお気に入りにする
  def mark_favorite(item)
    favorites.create(item_id: item.id)
  end

  # 商品をお気に入りから外す
  def remove_favorite(item)
    favorites.find_by(item_id: item.id).destroy
  end

  # お気に入り済みの確認
  def mark_favorite?(item)
    items.include?(item)
  end

  # 商品にコメントする
  def review_comment(item, comment_text)
    comments.build(item_id: item.id, text: comment_text)
  end

  # 商品のコメントを削除する
  def remove_comment(comment)
    comments.find(comment.id).destroy
  end

  def self.without_sns_data(auth)
    customer = Customer.where(email: auth.info.email).first

    if customer.present?
        sns = SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          customer_id: customer.id
        )
    else
        customer = Customer.new(
          nickname: auth.info.name,
          email: auth.info.email,
        )
        sns = SnsCredential.new(
          uid: auth.uid,
          provider: auth.provider
      )
    end
    return { customer: customer ,sns: sns}
  end

  def self.with_sns_data(auth, snscredential)
    customer = Customer.where(id: snscredential.customer_id).first
    return {customer: customer}
  end

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      customer = with_sns_data(auth, snscredential)[:customer]
    else
      customer = without_sns_data(auth)[:customer]
    end
    return { customer: customer}
  end
end
