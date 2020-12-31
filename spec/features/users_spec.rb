RSpec.feature 'Users', type: :feature do
  scenario "user successfully signs up with valid infomation" do
    visit new_user_registration_path
    expect do
      fill_in "名前", with: "Example"
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "パスワード", with: "test123"
      fill_in "パスワード（確認）", with: "test123"
      click_button "登録する"
    end.to change(User, :count).by(1)
  end

  scenario "user should not sign up with invalid infomation" do
    visit new_user_registration_path
    expect do
      fill_in "名前", with: ""
      fill_in "メールアドレス", with: "test@example.com.com"
      fill_in "パスワード", with: "test"
      fill_in "パスワード（確認）", with: "test"
      click_button "登録する"
    end.not_to change(User, :count)
  end
end
