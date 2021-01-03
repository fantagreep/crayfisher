RSpec.feature 'UsersEdit', type: :feature do
  given(:user) { create(:user) }

  before do
    create(:user, email: "test@example.com")
    visit new_user_session_path
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "foobar"
    click_button "ログイン"
  end

  scenario "successful edit" do
    visit edit_user_registration_path
    fill_in "名前", with: "hogehoge"
    fill_in "メールアドレス", with: "test@valid.com"
    click_button "設定する"
    expect(current_path).to eq root_path
  end

  scenario "unsuccessful edit" do
    visit edit_user_registration_path
    fill_in "名前", with: ""
    fill_in "メールアドレス", with: "test@invalid"
    click_button "設定する"
    expect(current_path).to eq user_registration_path
  end
end
