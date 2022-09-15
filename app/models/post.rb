class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def self.update_counter(author_id)
    puts 'something to print'
    user = User.find(author_id)
    user.posts_counter = user.posts_counter + 1
    user.save
  end
end
