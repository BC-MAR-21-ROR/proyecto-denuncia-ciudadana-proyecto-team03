RSpec.describe "/states", type: :request do

  fixtures :states
  fixtures :municipalities

  before(:each) do 
    user = User.create!(email: 'test@example.com', username: 'test', password: 'f4k3p455w0rd')
    user.confirm
    login_as(user, scope: :user)
  end

  describe "GET /show" do
    it "renders a successful response" do
      state = states(:one)
      (get "/states/#{state.id}.json")
      expect(response).to be_successful
    end
  end
end