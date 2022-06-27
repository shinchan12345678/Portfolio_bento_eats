require 'rails_helper'
# rubocop:disable all
describe 'テイクアウト情報投稿機能',type: :system do
  let(:owner_a) { FactoryBot.create(:owner, name: 'test_a') }
  let(:owner_b) { FactoryBot.create(:owner, name: 'test_b', email: 'testb@com') }

  shared_examples_for '投稿が削除されている' do
    it {
      within '.alert-success' do
        expect(page).to have_content '情報を削除しました'
      end
      expect(page).to have_content '情報が投稿されていません'
    }
  end

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

      context '情報登録画面のテスト' do
        before do
          find_all('a')[2].click
          fill_in '開始日', with: Date.current
          fill_in '終了日', with: Date.current
          fill_in '緯度' , with: 35.457724
        end

        it '投稿完了' do
          fill_in '経度' , with: 136.793811
          find_all('button')[0].click
          within '.alert-success' do
            expect(page).to have_content '情報を投稿しました'
          end
        end

        it '投稿後のリダイレクト先は正しいか' do
          fill_in '経度' , with: 136.793811
          find_all('button')[0].click
          expect(page).to have_current_path owner_owners_path
        end

        it '投稿失敗' do
          find_all('button')[0].click
          within '.alert-warning' do
            expect(page).to have_content '緯度 が入力されていません。'
          end
        end
      end
    end


    context '投稿の削除' do
      let(:login_owner) { owner_a }

      before do
        within '.table.table-hover' do
          find_all('a')[2].click
        end
      end

      it_behaves_like '投稿が削除されている'
    end

    context '投稿の編集' do
      let(:login_owner) { owner_a }

      before do
        within '.table.table-hover' do
          find_all('a')[1].click
        end
      end

      it '投稿の編集成功' do
        fill_in 'information_comment', with: '営業時間の変更'
        choose('information_is_valid_1')
        find_all('button')[0].click
        within '.table.table-hover' do
          expect(page).to have_content '掲載終了'
          expect(page).to have_content '営業時間の変更'
        end
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

    context 'オーナーが情報を削除すると表示されなくなる' do
      before do
        visit owner_session_path
        fill_in 'Email', with: 'testb@com'
        fill_in 'Password', with: 'password'
        click_button 'Log in'
        within '.table.table-hover' do
          find_all('a')[2].click
        end
      end

      it_behaves_like '投稿が削除されている'

      context '会員側で、ログインすると' do
        before do
          visit customer_session_path
          fill_in 'Email', with: 'test@com'
          fill_in 'Password', with: 'password'
          click_button 'Log in'
        end

        it 'オーナーBの投稿のみ削除される' do
        end
      end
    end
  end
end
# rubocop:enable all
