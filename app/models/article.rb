class Article < ApplicationRecord
  has_rich_text :body
  belongs_to :user

  validates :title, presence: true, length: {minimum: 5, max: 100}
  validates :body, presence: true
end
