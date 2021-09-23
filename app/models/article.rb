class Article < ApplicationRecord
  has_rich_text :body

  validates :title, presence: true, length: {minimum: 5, max: 100}
  validates :body, presence: true
end
