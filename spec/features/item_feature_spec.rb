require 'rails_helper'

feature 'item', type: :feature do
  let(:user) { create(:user) }

  scenario 'post item' do
    # ログイン前にはLog outボタンがない
    visit root_path
    expect(page).to have_no_content('Log out')

    # ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('#login').click
    expect(current_path).to eq root_path
    expect(page).to have_content('Log out')

    # 投稿
    expect {
      click_link('create')
      expect(current_path).to eq new_item_path
      fill_in 'item[contents]', with: 'フィーチャスペックのテスト'
      attach_file "item[image]", "#{Rails.root}/public/uploads/no_image.jpg"
      find('button[type="submit"]').click
    }.to change(Item, :count).by(1)
  end
end