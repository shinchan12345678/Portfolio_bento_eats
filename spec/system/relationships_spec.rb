require "rails_helper"

describe 'フォロー機能', type: :system do
  let(:customer_a) { FactoryBot.create(:customer, nickname: "test_customer_a") }
  let!(:owner_a) { FactoryBot.create(:owner, name: "test_owner_a", email: "test_a@com") }
  let!(:owner_b) { FactoryBot.create(:owner, name: "test_owner_b", email: "test_b@com") }

  shared_examples_for '飲食店が表示されている' do
    it {
      expect(page).to have_content 'test_owner_a'
      expect(page).to have_content 'test_owner_b'
    }
  end

  before do
    visit root_path
    find_all('a')[0].click
    fill_in 'Email', with: login_customer.email
    fill_in 'Password', with: login_customer.password
    click_button 'Log in'
  end

  context '会員Aがオーナーをフォローしたとき' do
    let(:login_customer) { customer_a }

    before do
      find_all('a')[1].click
      # binding.pry
    end

    it_behaves_like '飲食店が表示されている'

    it 'フォロワーが増加する' do
      find_all('a')[4].click
      expect(page).to have_content 'test_owner_a'
      expect(page).to have_content 'フォローする'
      expect(page).not_to have_content 'test_owner_b'
      within '#following_count' do
        expect(page).to have_content '0人'
      end
      FactoryBot.create(:relationship, customer: customer_a, owner: owner_a)
      visit current_path
      within '#following_count' do
        expect(page).to have_content '1人'
      end
      expect(Relationship.all.size).to be 1
      expect(page).to have_content 'フォローをやめる'
    end

    context '会員Aが別のオーナーをフォローしたとき' do
      before do
        FactoryBot.create(:relationship, customer: customer_a, owner: owner_a)
        FactoryBot.create(:relationship, customer: customer_a, owner: owner_b)
        find_all('a')[2].click
      end

      it_behaves_like '飲食店が表示されている'
    end
  end

  context '会員Aがすでにオーナーをフォローをしているとき' do
    let(:login_customer) { customer_a }

    before do
      FactoryBot.create(:relationship, customer: customer_a, owner: owner_a)
      FactoryBot.create(:relationship, customer: customer_a, owner: owner_b)
      find_all('a')[2].click
    end

    it_behaves_like '飲食店が表示されている'

    context '会員Aが1人のオーナーのフォローをやめたとき' do
      before do
        Relationship.last.delete
        visit current_path
      end

      it 'マイページに表示されなくなる' do
        expect(page).to have_content 'test_owner_a'
        expect(page).not_to have_content 'test_owner_b'
      end
    end
  end
end

describe 'フォローモデルのバリデーション' ,type: :model do
  let(:customer_a) { FactoryBot.create(:customer, nickname: "test_customer_a") }
  let(:owner_a) { FactoryBot.create(:owner, name: "test_owner_a", email: "test_a@com") }
  let(:owner_b) { FactoryBot.create(:owner, name: "test_owner_b", email: "test_b@com") }
  
  it 'nilチェック' do
    relationship = Relationship.new()
    relationship.valid?
    expect(relationship.errors.messages[:owner_id]).to include("が入力されていません。")
    expect(relationship.errors.messages[:customer_id]).to include("が入力されていません。")
  end
  
  it '重複登録できないことの確認' do
    FactoryBot.create(:relationship, customer: customer_a, owner: owner_a)
    relationship = Relationship.new(customer_id: customer_a.id, owner_id: owner_a.id)
    relationship.valid?
    expect(relationship.errors.messages[:customer_id]).to include("は既に使用されています。")
  end
  
  it '登録できることの確認' do
    FactoryBot.create(:relationship, customer: customer_a, owner: owner_a)
    relationship = Relationship.new(customer_id: customer_a.id, owner_id: owner_b.id)
    relationship.valid?
    expect(relationship.errors.messages.size).to be 0
  end
end
