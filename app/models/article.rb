class Article < ApplicationRecord
  scope :published, -> { where(is_published: true) }
  scope :draft, -> { where(is_published: false) }

  belongs_to :user
  validates :title, :content, :date, presence: true
  validates :title, length: { maximum: 120, 
    too_long: "content can only be %{count} characters maximum" }
  validates :content, length: { minimum: 120,
    too_short: "content should have at least %{count} characters" }

  acts_as_punchable
end
