class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: {in: 1..250}
  validates :comments_counter, numericality: {integer: true, greater_than_or_equal_to: 0}
  validates :likes_counter, numericality: {integer:true, greater_than_or_equal_to: 0}

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
