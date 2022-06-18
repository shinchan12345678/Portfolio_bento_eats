# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者
Admin.create(email: 'Admin@example.com', password: 'aaaaaa')

# 飲食店オーナー
Owner.create(email: 'a@example.com', password: 'aaaaaa', name: 'test' ,address: '岐阜県', telphone_number: '00000000')

# 会員
Customer.create(email: 'a@example.com', password: 'aaaaaa', nickname: 'test')

#商品の生成
owner=Owner.find_by(name: 'test')
(1..10).each do |i|
  Item.create(name: "幕内弁当#{i}", price: 500+i, introduction: "店長の試作品パート#{i}", owner_id: owner.id)
end
