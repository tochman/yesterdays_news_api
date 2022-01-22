RSpec.describe 'GET /api/articles', type: :request do
  subject { response }
  let!(:article) { 30.times { create(:article) } }

  describe 'successfully' do
    before do
      get '/api/articles'
    end

    it { is_expected.to have_http_status :ok }

    it 'is expected to return 20 articles' do
      
      expect(response_json['articles'].count).to eq 20
    end

    it 'is expected to respond with an article with title "This is a wonderful header"' do
      expect(response_json['articles'].last['title']).to eq 'This is a wonderful header'
    end
    it 'is expected to respond with a category "News' do
      expect(response_json['articles'].last['category']).to eq 'News'
    end
  end
end
