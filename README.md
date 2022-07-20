![名称ロゴ画像](https://user-images.githubusercontent.com/102851643/179893309-b9e55c67-44fc-4d9d-bb2e-f98f15107dea.png)
---
![トップ画像](https://user-images.githubusercontent.com/102851643/179878459-8de0615a-b263-4745-9e19-c3ef2ee8ac8c.png)

## サイト概要
テイクアウトできる飲食店を簡単に探すことができるSNSサイトです。<br>
飲食店のオーナーは、GoogleMap上に営業情報を投稿することができ、テイクアウトできる飲食店を探しているユーザーと簡単にマッチングできます！
また、ユーザーにフォローしてもらうことで、営業情報やクーポンを届けることができます！

### 【制作の背景】
<dl>
  <dt>テイクアウトできる飲食店が増えており、いつ・どんなお弁当を販売しているか簡単に調べることができたら便利だと考えたため</dt>
  <dd>近くでテイクアウト事業を開始した飲食店の営業情報を確認する手段が電話しかなく、ネットで営業情報を検索し、複数の飲食店から商品を比較して購入できたら便利だと考えました。</dd>

  <dt>飲食店のテイクアウト営業を支援することで、存続してもらうため（美味しいご飯が食べられる場所を守りたい！）</dt>
  <dd>緊急事態宣言等の影響を受けた多くの飲食店が、売上増加施策としてテイクアウト事業を開始しています。一方で、PR活動が難しく、常連にしか利用されないといった課題を持っていることが考えられるため、PR活動を支援するツールの需要は高いと言えます。またテイクアウトは来店するより安価に、そして感染症を気にせずその店の味を楽しめるため、その市場は今後も大きくなる可能性が高いと言えます。テイクアウト事業をサポートし、売上拡大に貢献することで、町のみんなが美味しいご飯を食べられる場所を存続させたいと考えました。</dd>

  <dt>美味しいご飯を食べることが好きであり、それをアプリケーション上で表現したいと考えたため</dt>
  <dd>ユーザーの食欲を掻き立て美味しいご飯を食べてもらうことで、健康で元気な生活を送ってほしいと思っています</dd>
</dl>

### 【ターゲットユーザー】
- テイクアウトできるお店を探している食通の方
- テイクアウト事業を始めたものの、集客に困っている飲食店オーナー

### 【主な利用シーン】
<dl>
  <dt>食通の方(一般利用者)</dt>
  <dd>テイクアウトできるお店を効率よく探したい時に利用します。テイクアウトできるお店をGoogleMap上で検索、気に入ったお店をフォローすることで営業情報やお得なクーポンを受け取ることができます。</dd>
  <dt>飲食店オーナー</dt>
  <dd>テイクアウト事業を始めたものの、売上が伸びないときに利用します。テイクアウト営業情報をGoogleMap上に投稿でき、フォロワーにクーポンやテイクアウト営業情報を通知できます。</dd>
</dl>

### 【サイトURL】
- [サイトURL](https://bentoeats.net/)
  > ゲストログインをクリックすることで、テストユーザーとしてログインできます。

## 機能一覧
- 情報投稿機能
  * 飲食店オーナーは、商品や営業情報を投稿できます。営業情報には位置情報(詳細な使い方は[こちら](https://speakerdeck.com/shinchan12345678/yin-shi-dian-onashi-ifang-suraito))が紐付けられ、GoogleMap上に掲載されます。
- マッチング（フォロー）機能
  * 一般利用者は、飲食店オーナーをフォローできます。
- クーポン機能
  * 飲食店オーナーは、フォロワーにクーポンを発行できます。
- 通知機能
  * 飲食店オーナーが営業情報を投稿した時、またはクーポンを発行した時にフォロワーに通知します。
- バッジ処理（メール機能）
  * 営業が終了した投稿の掲載状態を変更させることや期限切れのクーポンを削除する定時処理を行います。
  * 営業を開始する日に、飲食店オーナーの登録メールアドレスにリマインドメールが届きます。
- 検索機能
  * 位置情報をもとに、営業情報を検索できます(詳細な使い方は[こちら](https://speakerdeck.com/shinchan12345678/webapurimatupufalseshi-ifang-ban-li-yong-zhe-yong))。住所をもとに、飲食店も検索できます。
- レスポンシブデザイン（一般利用者ページのみ）
  * 外出先でも使用できるよう、一般利用者ページのみスマホ対応デザインになっています。

## 設計書
- ER図

![ER図](https://user-images.githubusercontent.com/102851643/179388943-49b33060-1d28-430e-b3e4-0e5bedf6caf1.jpg)
  >ER図が見にくい場合は、[こちら](https://drive.google.com/file/d/190SQWqajMvwmHvLalG3qwr6rYdJWSofj/view?usp=sharing) をご参照ください。
- [テーブル定義書](https://docs.google.com/spreadsheets/d/18Yz6ZwXigmcGdX10d_hcda0BXtH84INP/edit#gid=756628059)
- [画面遷移図](https://app.diagrams.net/#G1Nx-DLpkUmvxsOb35LBmMwi-6tPtv8VAF)
- [実装機能リスト](https://docs.google.com/spreadsheets/d/1-tDZI9Rpfst4rsdmH9qJW98YLsRyt5mre5MyCzAXBeE/edit#gid=1898975908)
- [テスト仕様書](https://docs.google.com/spreadsheets/d/1QgoErg15MSbFttV0-vBXiY01oHu-2CYr/edit#gid=547097470)


## 開発環境
- OS：Amazon Linux 2
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- CSSフレームワーク：Bootstrap
- JSライブラリ：jQuery
- テストフレームワーク：RSpec
- IDE：Cloud9

## インフラ構成図
![インフラ構成図](https://user-images.githubusercontent.com/102851643/179396327-40c6edfd-30f4-4be1-8d90-43f26c4781ed.jpg)

## 使用素材
- [イラストAC](https://www.ac-illust.com/)
- [フォトAC](https://en.photo-ac.com/)
- [PAKUTASO](https://www.pakutaso.com/)
- [Pixtabay](https://pixabay.com/ja/)
- [パブリックドメインQ](https://publicdomainq.net/)
- [フリー素材.com](https://free-materials.com/)
- [icon-rainbow](https://icon-rainbow.com/)
- [シルエットイラスト](https://www.silhouette-illust.com/)
- [ヤマナカデザインワークス](http://ymnk-design.com/12-2/)

## 開発の振り返り
- [PF発表会プレゼン資料](https://speakerdeck.com/shinchan12345678/kai-fa-zhen-rifan-ri)

