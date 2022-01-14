class Api::ArticlesController < ApplicationController
  def index
    latest_articles = Article.by_recently_created.limit(20)
    render json: { articles: latest_articles }
  end

  def show
    single_article = Article.find(params['id'])
    render json: { single_article: single_article }
  end
end
