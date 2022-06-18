class Information < ApplicationRecord
  belongs_to :owner
  # 領域内に収まる投稿のみ抽出する
  scope :map_view_ports, -> (latitude_s, latitude_e, longitude_s, longitude_e) do
    where(latitude: latitude_s..latitude_e, longitude: longitude_s..longitude_e)
  end
  # 当日の投稿のみ抽出する
  scope :today_is_valid, -> do
    open_date_check.close_date_check.info_invalid
  end
  scope :open_date_check, -> { where("open_date <= ?", DateTime.now) }
  scope :close_date_check, -> { where("close_date >= ?", DateTime.now) }
  scope :info_invalid, -> { where(is_valid: 0) }

  validates :open_date, presence: true
  validates :close_date, presence: true
  validates :is_valid, presence: true

  # 掲載中:0,掲載終了:1
  enum is_valid: {
    posting: 0,
    end_posting: 1
  }
end
