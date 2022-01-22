class Article < ApplicationRecord
  include OrderableByTimestamp
  validates_presence_of :title, :body, :category_id
  belongs_to :category
end
