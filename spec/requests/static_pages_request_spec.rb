RSpec.describe "StaticPages", type: :request do
  describe "GET /home" do
    before do
      get root_url
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
