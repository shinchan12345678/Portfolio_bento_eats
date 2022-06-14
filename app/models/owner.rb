class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :informations, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :relationships, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true
  validates :address, presence: true
  validates :telphone_number, presence: true

  # ゲストオーナーの生成
  def self.guest
    find_or_create_by!(name: 'Guest_owner', email: 'guest@example.com', address: '岐阜県', telphone_number: '0000000000') do |owner|
      owner.password = SecureRandom.urlsafe_base64
    end
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/test_item.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
    end
    image
  end
end
