class Item < ApplicationRecord
  belongs_to :owner
  has_many :favorites, dependent: :destroy
  has_many :comments, -> { order(created_at: :desc) }, dependent: :destroy

  has_one_attached :image

  validates :owner_id, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :introduction, presence: true

  # デフォルト画像の保存
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/test_item.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
    end
    image
  end
end
