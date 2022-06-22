require 'rails_helper'
# rubocop:disable all
describe '会員表示機能' do
  let!(:owner_a) { FactoryBot.create(:owner,email: 'test@com', name: 'a', address: '岐阜県関市') }
  let!(:owner_b) { FactoryBot.create(:owner,email: 'testb@com', name: 'b', address: '岐阜県岐阜市') }
  let!(:owner_c) { FactoryBot.create(:owner,email: 'testc@com', name: 'c', address: '愛知県名古屋市') }
  let!(:customer) { FactoryBot.create(:customer)}

  describe 'ログイン認証' do
    shared_examples_for 'テイクアウト情報ページに遷移する' do
      it {
        expect(page).to have_content 'テイクアウトジョーホー'
        click_button('button')
        expect(page).to have_content '朝から営業'
      }
    end

    before do
      FactoryBot.create(:information,owner: owner_a,comment: '朝から営業')
      visit root_path
      find_all('a')[0].click
    end

    context 'サインインできる' do
      before do
        fill_in 'Email', with: customer.email
        fill_in 'Password', with: 'password'
        click_button('commit')
      end

      it_behaves_like 'テイクアウト情報ページに遷移する'
    end

    context 'サインアップできる' do
      before do
        find_all('a')[0].click
        fill_in 'ニックネーム', with: 'test2'
        fill_in 'Email', with: 'test2@com'
        fill_in 'Password', with: 'password'
        fill_in 'Repeat Password', with: 'password'
        click_button('commit')
      end

      it_behaves_like 'テイクアウト情報ページに遷移する'
    end
  end
end

# rubocop:enable all

