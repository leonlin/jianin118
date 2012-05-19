class Post < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 256 }
  validates :content, presence: true
  default_scope order: 'posts.created_at DESC'

  def comment
    Comment.where("post_id = ?", id)
  end
end
