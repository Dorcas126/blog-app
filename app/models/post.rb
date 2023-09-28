class Post < ApplicationRecord
  has_many :likes, foreign_key: 'posts_id'
  has_many :comments, foreign_key: 'posts_id'
  belongs_to :author, class_name: 'User', dependent: :destroy, foreign_key: 'author_id'

  def update_posts_counter
    author.increment(:posts_counter)
  end

  :title
  :author_id
  :likes_counter

  def last_five_comments
    comments.last(5)
  end
end
