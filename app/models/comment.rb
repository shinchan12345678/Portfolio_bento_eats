class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :customer_id, presence: true
  validates :item_id, presence: true
  validates :text, presence: true
end
