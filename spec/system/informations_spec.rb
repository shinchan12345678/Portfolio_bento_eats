require 'rails_helper'
# rubocop:disable all
describe 'テイクアウト情報投稿機能',type: :system do
  let(:owner_a) { FactoryBot.create(:owner, name: 'test_a') }
  let(:owner_b) { FactoryBot.create(:owner, name: 'test_b', email: 'testb@com') }

  describe '一覧表示機能(オーナー)' do
    before do
      FactoryBot.create(:information, owner: owner_a)

      visit owner_session_path
      fill_in 'Email', with: login_owner.email
      fill_in 'Password', with: login_owner.password
      click_button 'Log in'
    end

    context 'オーナーAがログインしているとき' do
      let(:login_owner) { owner_a }

      it 'オーナーAが作成した投稿が表示される' do
        expect(page).to have_content '営業は9時から'
      end
    end

    context 'オーナーBがログインしているとき' do
      let(:login_owner) { owner_b }

      it 'オーナーAの投稿が表示されない' do
        expect(page).not_to have_content '営業は9時から'
      end
    end


  end

  describe '一覧表示機能(会員側)' do
    before do
      FactoryBot.create(:customer)
      FactoryBot.create(:information, owner: owner_a)
      FactoryBot.create(:information, owner: owner_b)

      visit customer_session_path
      fill_in 'Email', with: 'test@com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    context '会員でログインしているとき' do
      before do
        expect(page).to have_content 'テイクアウトジョーホー'
        find_all('button')[1].click
      end

      it '投稿が表示される' do
        expect(page).to have_content 'ヒットジョーホー'
        expect(page).to have_content owner_a.name
        expect(page).to have_content owner_b.name
      end
    end
  end
end
# rubocop:enable all