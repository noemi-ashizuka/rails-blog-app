class Article < ApplicationRecord
  belongs_to :user

  validates :title, :content, :date, presence: true
end
