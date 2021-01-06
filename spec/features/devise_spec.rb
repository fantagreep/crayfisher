RSpec.feature 'Devise', type: :feature do
  given!(:user) { create(:user, email: "test@example.com") }

  scenario "user successfully login with valid infomation" do
    visit new_user_session_path
    expect(page).to have_link 'ログイン'
    expect(page).to have_link '新規登録'
    expect(page).to have_no_link 'プロフィール'
    expect(page).to have_no_link 'ログアウト'
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "foobar"
    click_button "ログイン"
    expect(current_path).to eq root_path
    expect(page).to have_no_link 'ログイン'
    expect(page).to have_no_link '新規登録'
    expect(page).to have_link user.name
    expect(page).to have_link 'ログアウト'
    click_on "ログアウト"
  end

  scenario "user should not login with wrong password" do
    visit new_user_session_path
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "barfoo"
    click_button "ログイン"
    expect(current_path).to eq new_user_session_path
    expect(page).to have_link 'ログイン'
    expect(page).to have_link '新規登録'
    expect(page).to have_no_link 'プロフィール'
    expect(page).to have_no_link 'ログアウト'
  end
end
