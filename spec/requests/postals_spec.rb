RSpec.describe "/postals", type: :request do

  fixtures :states
  fixtures :municipalities
  fixtures :postals
  fixtures :settlements

  before(:each) do 
    user = User.create!(email: 'test@example.com', username: 'test', password: 'f4k3p455w0rd')
    user.confirm
    login_as(user, scope: :user)
  end

  describe "GET /show" do
    it "renders a successful response" do
      postal = postals(:one)
      (get "/postals/#{postal.id}.json")
      expect(response).to be_successful
    end
  end
end