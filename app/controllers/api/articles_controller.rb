class Api::ArticlesController < ApplicationController
  def index
    latest_articles = Article.by_recently_created.limit(20)
    render json: { articles: latest_articles }
  end
end
