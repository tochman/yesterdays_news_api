RSpec.describe 'GET /api/articles', type: :request do
  describe 'succesfully' do
    subject { respsone }
    let!(:article) { 5.times { create(:article, title: 'Covid-19 is a pandemic') } }

    before do
      get '/api/articles'
    end

    it { is_expected.to have_http_status :ok }

    it 'is expected to return 5 articles' do
      expect(response_json['articles'].count).to eq 5
    end

    it 'is expected to respond with an article with title "Covid-19 is a pandemic"' do
      expect(response_json['articles'].first['title']).to eq 'Covid-19 is a pandemic'
    end
  end
end
