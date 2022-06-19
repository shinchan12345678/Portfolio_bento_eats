class Relationship < ApplicationRecord
  belongs_to :customer
  belongs_to :owner

  validates :customer_id, presence: true, uniqueness: { scope: :owner_id }
  validates :owner_id, presence: true
end
