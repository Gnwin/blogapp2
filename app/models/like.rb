class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def increment_posts_likes_counter
    post.increment!(:likes_counter)
  end
end
