describe 'GET /api/articles/:id', type: :request do
  let!(:article) { create(:article, title: 'Hello World', body: 'The world is a strange place') }
  subject { response }

  describe 'successfully retrieves article' do
    before do
      get "/api/articles/#{article.id}"
    end

    it { is_expected.to have_http_status :ok }

    it 'is expected to respond with the requested article title' do
      expect(response_json['article']['title']).to eq 'Hello World'
    end
    it 'is expected to respond with the requested article body' do
      expect(response_json['article']['body']).to eq 'The world is a strange place'
    end
  end
  describe 'unsuccessfully - id not found' do
    before do
      get '/api/articles/pineapple_pizza'
    end

    it { is_expected.to have_http_status :not_found }

    it 'is expected to return an error message' do
      expect(response_json['message']).to eq 'Article not found'
    end
  end
end
