RSpec.describe "StaticPages", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get root_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /about" do
    it "returns http success" do
      get about_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /terms" do
    it "returns http success" do
      get terms_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /policy" do
    it "returns http success" do
      get policy_url
      expect(response).to have_http_status(:success)
    end
  end
end
