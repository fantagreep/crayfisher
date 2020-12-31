RSpec.describe "Users", type: :request do
  describe "GET /signup" do
    it "returns http success" do
      get new_user_registration_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /users/edit" do
    it "redirects edit when not logged in" do
      get edit_user_registration_path
      expect(response).to redirect_to new_user_session_path
    end
  end
end
