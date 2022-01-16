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

    it 'is expected to have saved the article in the database' do
      expect(@article.title).to eq 'Mars and Venus together'
    end
  end

  describe 'unsuccessfully' do
    describe 'due to missing params' do
      # write test in case we receive a POST request with missing params
    end

    describe 'due to missing title' do
      # write test in case we receive a POST request with missing title
    end

    describe 'due to missing body' do
      # write test in case we receive a POST request with missing body
    end

    describe 'due to missing category' do
      # write test in case we receive a POST request with missing category
    end
  end
end
