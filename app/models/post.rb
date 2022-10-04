class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, numericality: { integer: true, greater_than_or_equal_to: 0 }, allow_blank: true
  validates :likes_counter, numericality: { integer: true, greater_than_or_equal_to: 0 }, allow_blank: true

  after_save :update_posts_counter
  
  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
