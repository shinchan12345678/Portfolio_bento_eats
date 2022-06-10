class Information < ApplicationRecord
  belongs_to :owner
  scope :map_view_ports, -> (latitude_s,latitude_e,longitude_s,longitude_e) do
    where(latitude: latitude_s..latitude_e, longitude: longitude_s..longitude_e)
  end

  validates :open_date, presence: true
  validates :close_date, presence: true
  validates :is_valid, presence: true

  # 掲載中:0,掲載終了:1
  enum is_valid: {
    posting: 0,
    end_posting: 1
  }
end
