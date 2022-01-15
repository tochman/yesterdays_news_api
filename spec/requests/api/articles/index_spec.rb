RSpec.describe 'GET /api/articles', type: :request do
  describe 'succesfully' do
    subject { response }
    let!(:article) { 30.times { create(:article, title: 'Covid-19 is a pandemic', category: 'News') } }
    before do
      get '/api/articles'
    end

    it { is_expected.to have_http_status :ok }

    it 'is expected to return 20 articles' do
      expect(response_json['articles'].count).to eq 20
    end

    it 'is expected to respond with an article with title "Covid-19 is a pandemic"' do
      expect(response_json['articles'].first['title']).to eq 'Covid-19 is a pandemic'
    end

    it 'is expected to contain category "News"' do
      expect(response_json['articles'].first['category']).to eq 'News'
    end
  end
end
