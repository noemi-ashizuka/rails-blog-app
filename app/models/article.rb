class Article < ApplicationRecord
  scope :published, -> { where(is_published: true) }
  scope :draft, -> { where(is_published: false) }

  belongs_to :user
  validates :title, :content, :date, presence: true

  acts_as_punchable
end
