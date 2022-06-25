# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者
Admin.create(email: 'Admin@example.com', password: 'aaaaaa')

shop_name = [['居酒屋 ヨシヒコ','shop_test_4.jpg','基本何でも作れます。'],['麺屋 日の出','shop_test_7.jpg','ラーメン以外もお任せあれ'],['洋食屋 ゲンキ','shop_test_3.jpg','フランスで修行してきました'],['定食 HIFUMI','shop_test_0.jpg','オーガニックにこだわっています'],['レストラン 白ごま','shop_test_1.jpg','隠し味は全て白ごまです'],['ビストロ gomaya','shop_test_2.jpg','ゴマをふんだんに使った料理をご賞味あれ'],['焼肉 TT','shop_test_6.jpg','肉料理以外もリーズナブルに提供できます'],['CAFE カモメ','shop_test_5.jpg','食後のコーヒー無料です。もちろんテイクアウトの方にもお渡しいたします！'],['何でも屋','test_owner.png','何でも揃います'],['業務用スーパー','test_owner.png','安い、大きい、うまいがモットーです']]
address_random = ['神田町','玉森町','長住町']

# 飲食店オーナー
shop_name.each_with_index do |i, num|
  owner = Owner.create(name: '（架空の店舗）' + i[0] ,email: "owner_test_#{SecureRandom.base64(3)}@example.com", password: 'aaaaaa', address: '岐阜県岐阜市'+address_random[rand(0..2)], telphone_number: '00000000',introduction: i[2])
  owner.image.attach(io: File.open(Rails.root.join("app/assets/images/#{i[1]}")),filename: i[1] )
end

dami_nickname = ['なると','sasuke','フシグロ']

# 会員
dami_nickname.each do |i|
  Customer.create(email: "customer_test_#{SecureRandom.base64(3)}@example.com", password: 'aaaaaa', nickname: i)
end


# 商品の生成
items = [['寿司弁当',1200,'sushi.jpg','お寿司をリーズナブルにご家庭で！'],['ビーフシチュー弁当',1000,'beefshityu.jpg','こぼれやすいので気をつけてお持ち帰りください'],['ケバブ弁当',900,'kebabu.jpg','屋台のケバブよりうまいです！'],['幕内弁当',800,'bento.jpg','心を込めて作りました'],['餃子弁当',900,'gyoza.jpg','にんにく抜き餃子です！女性にも大人気'],['唐揚げ弁当',900,'karaage.jpg','ボリューム満点'],['うな重弁当',2900,'unazyu.jpg','ちょっと贅沢な一品です'],['牛飯弁当',900,'gyoumeshi.jpg','甘く煮てあります'],['おにぎり',900,'onigiri.jpg','具材は、梅とシャケです。コシヒカリを使用しております'],['ピザ弁当',900,'piza.jpg','宅配ピザとは一味違います'],['恵方巻弁当',1200,'ehomaki.jpg','大豆もセット'],['オムレツ弁当',900,'omuretu.jpg','ソースはデミグラスとケチャップからお選びいただけます'],['サンドイッチ',600,'sandwitch.jpg','挟む具材は日替わりです。'],['カラフル弁当',900,'karafurubento.jpg','見た目に自信があります'],['ハンバーガーセット',1000,'handbang.jpg','パティーに飛騨牛を使用しています'],['（究極）唐揚げ弁当',2000,'karaagebento.jpg','高級な唐揚げです'],['おしゃれ弁当',900,'osyare.jpg','女性に大人気！！']]
# ['おせち風弁当',1900,'osechi.jpg','おせちをお弁当にしちゃいました。ぜひお試しあれ'],['コロッケ弁当',500,'korokke.jpg','サクサクです'],['アジフライ弁当',700,'azifry.jpg','実は一番人気！']
owners=Owner.all
owners.each do |o|
  5.times do
    num= rand(0..16)
    item = Item.create(name: items[num][0], price: items[num][1], introduction: items[num][3], owner_id: o.id)
    item.image.attach(io: File.open(Rails.root.join("app/assets/images/#{items[num][2]}")),filename: items[num][2] )
  end
end

# 情報の投稿
base_address = [35.4095278,136.7564656]
owners = Owner.all
owners.each do |o|
  date = Date.today
  3.times do
    random_num = rand(0..3)
    date += random_num + rand(0..3)
    Information.create(open_date: date, close_date: date+random_num, comment: '朝9時から営業', latitude: base_address[0] + rand(1..5).quo(1000).to_f,longitude: base_address[1]+rand(1..5).quo(1000).to_f,is_valid: 0,owner_id: o.id)
  end
end
