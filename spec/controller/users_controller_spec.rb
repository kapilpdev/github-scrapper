require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = User.create(username: "Testing") 
  end

  describe 'GET/index' do
    it 'will give all users' do 
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST/create" do
    it "creates the user" do
      stub_request(:get, "https://api.github.com/users/xyz/repos")
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Ruby'
          }
        )
        .to_return(status: 200, body: '[]', headers: {})

      post :create, params: { user: { username: "svishvakarma"}}

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET/show" do
    it "shows the user" do
      stub_request(:get, "https://api.github.com/users/abc/repos")
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Ruby'
          }
        )
        .to_return(status: 200, body: "", headers: {})

      user = User.create(username: "svishvakarma")
      get :show, params: { id: user.id }

      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT/delete" do
    it 'will delete the user' do
      stub_request(:get, "https://api.github.com/users/abc/repos")
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Ruby'
          }
        )
        .to_return(status: 200, body: "", headers: {})

      user = User.create(username: "svishvakarma")
      put :destroy, params: { id: user.id }

      expect(response).to have_http_status(302)
    end
  end
end
