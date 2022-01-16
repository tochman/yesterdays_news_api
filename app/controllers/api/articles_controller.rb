class Api::ArticlesController < ApplicationController
  def index
    if params['category'].nil?
      latest_articles = Article.by_recently_created.limit(20)
    else
      latest_articles = Article.where(category: params['category']).by_recently_created.limit(20)
    end
    render json: { articles: latest_articles }
  end

  def show
    article = Article.find(params['id'])
    render json: { article: article }
  rescue ActiveRecord::RecordNotFound => e
    render_error('Article not found', 404)
  end

  def create
    article = Article.create(article_params)
    if article.persisted?
      render json: { article: article }, status: 201
    else
      render_error(article.errors.full_messages.to_sentence, 422)
    end
  end

  private

  def render_error(message, status)
    render json: { message: message }, status: status
  end

  def article_params
    params[:article].permit(:title, :body, :category)
  end
end
