require 'rails_helper'
# rubocop:disable all
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

  describe 'カスタマー側ヘッダーの確認' do
    before do
      customer_a = FactoryBot.create(:customer)
      visit customer_session_path
      fill_in 'Email', with: 'test@com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'テイクアウトジョーホーリンクの確認' do
      show_link_0 = find_all('a')[0]
      expect(show_link_0.native.inner_text).to match('テイクアウトジョーホー')
      show_link_0.click
      expect(page).to have_content 'テイクアウトジョーホー'
    end

    it 'インショクテンイチランリンクの確認' do
      show_link_1 = find_all('a')[1]
      expect(show_link_1.native.inner_text).to match('インショクテンイチラン')
      show_link_1.click
      expect(page).to have_content 'インショクテンイチラン'
      expect(page).to have_selector 'form'
    end

    it 'ログアウトリンクの確認' do
      show_link_3 = find_all('a')[3]
      expect(show_link_3.native.inner_text).to match('ログアウト')
      show_link_3.click
      expect(page).to have_content 'お弁当検索はこちら(通常利用)'
    end
  end

  describe 'オーナー側ヘッダーの確認' do
    before do
      owner_a = FactoryBot.create(:owner)
      visit owner_session_path
      fill_in 'Email', with: 'test@com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'マイページリンクの確認' do
      show_link_0 = find_all('a')[0]
      expect(show_link_0.native.inner_text).to match('マイページ')
      show_link_0.click
      expect(page).to have_selector 'table'
      expect(find_all('th')[4].native.inner_text).to match '掲載状況'
    end

    it '商品登録リンクの確認' do
      show_link_1 = find_all('a')[1]
      expect(show_link_1.native.inner_text).to match('ショウヒントーロク')
      show_link_1.click
      expect(page).to have_content '商品情報を入力してください'
    end

    it '情報投稿リンクの確認' do
      show_link_2 = find_all('a')[2]
      expect(show_link_2.native.inner_text).to match('ジョーホートーコウ')
      show_link_2.click
      expect(page).to have_content 'テイクアウト営業情報を入力してください'
    end

    it 'ログアウトリンクの確認' do
      show_link_3 = find_all('a')[3]
      expect(show_link_3.native.inner_text).to match('ログアウト')
      show_link_3.click
      expect(page).to have_content 'お弁当検索はこちら(通常利用)'
    end
  end
end
