class Comment < ActiveRecord::Base
  attr_accessible :content, :email, :name, :url
  belongs_to :post
  validates :post_id, presence: true
  validates :name, presence: true, length: { maximum: 128 }
  validates :content, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :url, length: {maximum: 256}

  default_scope order: 'comments.created_at DESC'
end
