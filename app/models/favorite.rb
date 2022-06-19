class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :customer_id, presence: true, uniqueness: { scope: :item_id }
  validates :item_id, presence: true
end
