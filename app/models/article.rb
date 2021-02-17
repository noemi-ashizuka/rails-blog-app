class Article < ApplicationRecord
  scope :published, -> { where('publish_at <= ?', Time.zone.now) }
  scope :draft, -> { where('publish_at > ?', Time.zone.now) }

  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :title, :content, :publish_at, presence: true
  validates :title, length: { maximum: 120, 
    too_long: "content can only be %{count} characters maximum" }
  validates :content, length: { minimum: 120,
    too_short: "content should have at least %{count} characters" }

  acts_as_punchable
end
