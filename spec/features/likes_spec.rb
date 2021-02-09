RSpec.feature 'Likes', type: :feature do
  before do
    @user = create(:user)
    @another_user = create(:another_user, email: "test@example.com")
    @post = create(:post)
    visit new_user_session_path
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "foobar"
    click_button "ログイン"
  end

  scenario "user successfully likes the post" do
    visit root_path
    within '.feed' do
      expect do
        click_on(class: "like-btn-like")
      end.to change(Like, :count).by(1)
      expect(current_path). to eq root_path
    end
  end
end
