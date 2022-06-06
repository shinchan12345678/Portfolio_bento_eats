class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :relationships, dependent: :destroy
  has_many :owners, through: :relationships
  has_many :favorites, dependent: :destroy
  has_many :items, through: :favorites
  has_many :comments, dependent: :destroy

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
    comments.create(item_id: item.id, text: comment_text)
  end

  # 商品のコメントを削除する
  def remove_comment(comment)
    comments.find(comment.id).destroy
  end
end
