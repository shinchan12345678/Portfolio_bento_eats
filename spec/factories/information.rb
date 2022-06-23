FactoryBot.define do
  factory :information do
    open_date { Date.current }
    close_date { Date.current }
    comment { '営業は9時から' }
    latitude { 35.4577205 }
    longitude { 136.793811 }
    is_valid { 'posting' }
    owner
  end
end
