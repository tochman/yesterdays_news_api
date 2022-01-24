class Article::ShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :category, :published

  def published
    object.created_at.to_formatted_s(:long)
  end

  def category
    object.category.name.humanize
  end
end
