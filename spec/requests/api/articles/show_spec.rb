describe 'GET /api/articles/:id', type: :request do
  let!(:article) { create(:article, title: 'Hello World', body: 'The world is a strange place') }
  subject { response }

  describe 'succesfully' do
    before do
      get "/api/articles/#{article.id}"
    end

    it { is_expected.to have_http_status :ok }

    it 'is expected to respond with the requested article title' do
      expect(response_json['single_article']['title']).to eq 'Hello World'
    end
    it 'is expected to respond with the requested article body' do
      expect(response_json['single_article']['body']).to eq 'The world is a strange place'
    end
  end
end
