class Post < ApplicationRecord
  has_many :likes, foreign_key: 'posts_id'
  has_many :comments, foreign_key: 'posts_id'
  belongs_to :author, class_name: 'User', dependent: :destroy, foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  validates :author_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true, length: { in: 1..250 }
  validates :text, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_posts_counter

  def update_posts_counter
    author.increment(:posts_counter)
    author_id = author.id
    User.increment_counter(:posts_counter, author_id)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
