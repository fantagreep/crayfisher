RSpec.feature 'Comments', type: :feature do
  given(:user) { create(:user) }

  before do
    create(:user, email: "test@example.com")
    visit new_user_session_path
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "foobar"
    click_button "ログイン"
    visit root_path
    fill_in "address", with: "Example"
    fill_in "post-content", with: "Example"
    click_button "投稿する"
  end

  scenario "user successfully posts with content" do
    visit root_path
    within '.comment' do
      expect do
        fill_in "comment-content", with: "Example"
        click_on 'コメントする'
      end.to change(Comment, :count).by(1)
      expect(current_path). to eq root_path
    end
  end

  scenario "user unsuccessfully posts without content" do
    visit root_path
    within '.comment' do
      expect do
        fill_in "comment-content", with: ""
        click_on 'コメントする'
      end.not_to change(Comment, :count)
      expect(current_path). to eq root_path
    end
  end
end
