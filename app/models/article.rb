class Article < ApplicationRecord
  belongs_to :user
  validates :title, :content, :date, presence: true

  acts_as_punchable
end
