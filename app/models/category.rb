class Category < ApplicationRecord
  validates_presence_of :category
  has_many :articles
end
