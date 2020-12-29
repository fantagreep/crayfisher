RSpec.describe "Users", type: :request do
  describe "GET /signup" do
    it "returns http success" do
      get new_user_registration_path
      expect(response).to have_http_status(:success)
    end
  end
end
