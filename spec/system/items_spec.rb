require 'rails_helper'
# rubocop:disable all

describe '商品登録機能', type: :system do
  describe '一覧表示機能' do
    before do
      owner_a = FactoryBot.create(:owner)
      item_a = FactoryBot.create(:item, owner: owner_a)
    end

    context 'オーナーAがログインしているとき' do
      before do
        visit owner_session_path
        fill_in 'Email', with: 'test@com'
        fill_in 'Password', with: 'password'
        click_button 'Log in'
      end

      it 'ヘッダーリンクの確認' do

      end

      it 'オーナーが登録した商品が表示される' do
        expect(page).to have_content '200円'
        expect(page).to have_content '幕内弁当'
      end

      context '商品登録画面のテスト' do
        before do
          show_link = find_all('a')[1]
          show_link.click
          fill_in '商品名', with: '幕内弁当2'
          fill_in '値段', with: 300
          fill_in '商品紹介', with: Faker::Lorem.sentence
          click_button 'トーロクする'
        end

        it '商品が登録されている' do
          expect(page).to have_content '300円'
          expect(page).to have_content '幕内弁当2'
        end
      end
    end

    context 'オーナーBがログインしているとき' do
      before do
        owner_b = FactoryBot.create(:owner, name: 'test2', email: 'test2@com')
        visit owner_session_path
        fill_in 'Email', with: 'test2@com'
        fill_in 'Password', with: 'password'
        click_button 'Log in'
      end

      it 'オーナーAの商品が表示されない' do
        expect(page).not_to have_content '200円'
        expect(page).not_to have_content '幕内弁当'
      end
    end

    context '一覧表示機能(会員側)' do
      before do
        visit customer_session_path
        fill_in 'Email', with: 'test@com'
        fill_in 'Password', with: 'password'
        click_button 'Log in'
      end

      context '会員でログインしているとき' do
        before do
          viset item_path(Item.last)
        end

        it '投稿が表示される' do

        end
      end
    end
  end
end

# rubocop:enable all
