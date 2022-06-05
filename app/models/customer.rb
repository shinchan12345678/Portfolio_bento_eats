class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :relationships, dependent: :destroy
  has_many :owners, through: :relationships

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
end
