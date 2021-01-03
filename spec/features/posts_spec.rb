RSpec.feature 'Post', type: :feature do
  given(:user) { create(:user) }
  given(:other_user) { create(:user, email: "example-2@example.com") }

  before do
    create(:user, email: "test@example.com")
    visit new_user_session_path
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "foobar"
    click_button "ログイン"
  end

  scenario "user successfully posts with content" do
    visit root_path
    expect do
      fill_in "post-content", with: "Example"
      click_button "投稿する"
    end.to change(Post, :count).by(1)
    expect(current_path). to eq root_path
    within '.col-md-8' do
      expect(find('.posts')).to have_content "Example"
      expect do
        click_on "削除する"
      end.to change(Post, :count).by(-1)
      expect(page).to have_no_content "Example"
    end
    visit user_path(other_user)
    expect(page).to have_no_link "削除する"
  end

  scenario "user unsuccessfully posts without content" do
    visit root_path
    expect do
      fill_in "post-content", with: ""
      click_button "投稿する"
    end.not_to change(Post, :count)
    expect(current_path). to eq root_path
    expect(find('.col-md-8')).to have_no_content "Example"
  end
end
