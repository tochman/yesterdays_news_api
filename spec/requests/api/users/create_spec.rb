RSpec.describe 'POST /api/auth', type: :request do
  subject { response }
  describe 'successful registration' do
    before do
      post '/api/auth',
           params: {
             name: 'John Doe',
             email: 'johndoe@email.com',
             password: 'password',
             password_confirmation: 'password'
           }
      @user = User.last
    end

    it { is_expected.to have_http_status 200 }

    it 'is expected to return an access token to the user' do
      expect(response.header['access-token']).not_to eq nil
    end

    it 'is expected that database update with new user' do
      expect(@user.email).to eq 'johndoe@email.com'
    end

    it 'is expected that database update with new user' do
      expect(@user.name).to eq 'John Doe'
    end
  end

  describe 'with password not matching' do
    before do
      post '/api/auth',
           params: {
             email: 'johndoe@email.com',
             name: 'John Doe',
             password: 'password',
             password_confirmation: 'wrong_password'
           }
    end

    it 'is expected to return a error message when password do not match' do
      expect(response_json['errors']['full_messages']).to eq ["Password confirmation doesn't match Password"]
    end
  end

  describe 'with invalid email' do
    before do
      post '/api/auth',
           params: {
             email: 'not_an_email',
             name: 'John Doe',
             password: 'password',
             password_confirmation: 'password'
           }
    end
    it 'is expected to respond with status 422' do
      expect(subject.status).to eq 422
    end

    it 'is expected to respond with error message' do
      expect(response_json['errors']['full_messages']).to eq ['Email is not an email']
    end
  end
end
