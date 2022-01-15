RSpec.describe 'POST /api/articles', type: :request do
  subject { response }

  describe 'with valid params' do
    before do
      post '/api/articles', params: {
        article: {
          title: 'Mars and Venus together',
          body: 'There is water on Mars',
          category: 'news'
        }
      }
      @article = Article.last
    end

    it { is_expected.to have_http_status :created }

    it 'is expected to create an instance of Article' do
      expect(@article).to_not eq nil
    end
  end
end
