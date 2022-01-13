class Article < ApplicationRecord
  include OrderableByTimestamp
  validates_presence_of :title, :body
end
