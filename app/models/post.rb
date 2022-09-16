class Post < ApplicationRecord
  has_many :comment
  has_many :like
  belongs_to :user

  after_save :increment_user_posts_count

  private
  
  def increment_user_posts_count
    user.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
