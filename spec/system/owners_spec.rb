require 'rails_helper'

describe 'トップページ、ヘッダー・フッターの確認', type: :system do
  describe 'topページのリンク確認' do
    context '会員側' do
      before do
        visit root_path
      end

      it 'ログイン画面に遷移できるか' do
        show_link = find_all('a')[0]
        expect(show_link.native.inner_text).to match(/ログイン/)
        show_link.click
        expect(page).to have_content 'Log in'
      end

      it 'ゲストログインできるか' do
        show_link = find_all('a')[1]
        expect(show_link.native.inner_text).to match(/ゲストログイン/)
        show_link.click
        expect(page).to have_content 'ゲストとしてログインしました'
      end
    end

    context 'オーナー側' do
      before do
        visit root_path
      end

      it 'ログイン画面に遷移できるか' do
        show_link = find_all('a')[2]
        expect(show_link.native.inner_text).to match(/ログイン/)
        show_link.click
        expect(page).to have_content 'Log in'
      end

      it 'ゲストログインできるか' do
        show_link = find_all('a')[3]
        expect(show_link.native.inner_text).to match(/ゲストログイン/)
        show_link.click
        expect(page).to have_content 'ゲストオーナーとしてログインしました'
      end
    end
  end
  
  describe 'オーナー側ヘッダーの確認'do 
    before do
      owner_a = FactoryBot.create(:owner)
      visit owner_session_path
      fill_in 'Email', with: 'test@com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end
    
    it 'リンクの確認' do
      show_link_0 = find_all('a')[0]
      expect(show_link_0.native.inner_text).to match('マイページ')
    end
  end
end

describe '商品登録機能', type: :system do
  describe '一覧表示機能' do
    before do
      owner_a = FactoryBot.create(:owner)
      item_a = FactoryBot.create(:item,owner: owner_a)
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
        owner_b = FactoryBot.create(:owner,name: 'test2',email: 'test2@com')
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
  end
end

# describe 'テイクアウト情報投稿機能',type: :system do

# end