require 'rails_helper'
# rubocop:disable all
describe 'オーナー表示機能' do
  let!(:owner_a) { FactoryBot.create(:owner,email: 'test@com', name: 'a', address: '岐阜県関市') }
  let!(:owner_b) { FactoryBot.create(:owner,email: 'testb@com', name: 'b', address: '岐阜県岐阜市') }
  let!(:owner_c) { FactoryBot.create(:owner,email: 'testc@com', name: 'c', address: '愛知県名古屋市') }
  let!(:customer) { FactoryBot.create(:customer)}

  describe 'ログイン認証' do
    shared_examples_for 'テイクアウト情報ページに遷移する' do
      it { expect(page).to have_content 'エイギョウジョーホー' }
    end

    before do
      FactoryBot.create(:information,owner: owner_a,comment: '朝から営業')
      visit root_path
      find_all('a')[2].click
    end

    context 'サインインできる' do
      before do
        fill_in 'Email', with: owner_a.email
        fill_in 'Password', with: 'password'
        click_button('commit')
      end

      it_behaves_like 'テイクアウト情報ページに遷移する'

      it '投稿の確認' do
        expect(page).to have_content '朝から営業'
      end
    end

    context 'サインインできない' do
      before do
        fill_in 'Email', with: 'miss'
        fill_in 'Password', with: 'password'
        click_button('commit')
      end

      it 'ログイン画面にリダイレクト' do
        within '.alert' do
          expect(page).to have_content 'Email もしくはパスワードが不正です。'
          expect(current_path).to eq('/owners/sign_in')
        end
      end
    end

    context 'サインアップできる' do
      before do
        find_all('a')[0].click
        fill_in '飲食店名', with: 'test2'
        fill_in '住所', with: '岐阜県'
        fill_in 'Email', with: 'test2@com'
        fill_in '電話番号', with: '0000000000'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button('commit')
      end

      it_behaves_like 'テイクアウト情報ページに遷移する'
    end

    context 'サインアップできない' do
      before do
        find_all('a')[0].click
        fill_in '飲食店名', with: 'test2'
        fill_in '住所', with: '岐阜県'
        fill_in '電話番号', with: '0000000000'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button('commit')
      end

      it 'サインアップ画面にリダイレクト' do
        within '.alert' do
          expect(page).to have_content 'Email が入力されていません。'
          expect(current_path).to eq('/owners')
        end
      end
    end

  end

  describe 'オーナーの並べ替え表示機能' do
    before do
      visit customer_session_path
      fill_in 'Email', with: 'test@com'
      fill_in 'Password', with: 'password'
      click_button('commit')
      find_all('a')[1].click
    end

    it '表示の確認' do
      expect(all(:css, '.owner_card').size).to eq(3)
      expect(page).to have_content 'a'
      expect(page).to have_content 'b'
      expect(page).to have_content 'c'
    end

    context '並べ替えの確認' do
      it '岐阜県で並べ替えて2件表示される' do
        fill_in 'q_address_cont', with: '岐阜県'
        click_button('button')
         expect(all(:css, '.owner_card').size).to eq(2)
        expect(page).to have_content 'a'
        expect(page).to have_content 'b'
      end

      shared_examples_for '岐阜県関市の飲食店が表示される' do
        it {
           expect(all(:css, '.owner_card').size).to eq(1)
          expect(page).to have_content 'a'
        }
      end

      context '絞り込みの確認'  do
        context '岐阜県関市で検索' do
          before do
            fill_in 'q_address_cont', with: '岐阜県関市'
            click_button('button')
          end

          it_behaves_like '岐阜県関市の飲食店が表示される'
        end

        context '関市で検索' do
          before do
            fill_in 'q_address_cont', with: '関市'
            click_button('button')
          end

          it_behaves_like '岐阜県関市の飲食店が表示される'
        end
      end
    end
  end
end
# rubocop:enable all
