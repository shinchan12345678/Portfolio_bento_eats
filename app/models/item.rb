class Item < ApplicationRecord
  belongs_to :owner

  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true
  validates :introduction, presence: true
end
