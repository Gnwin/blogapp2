class Post < ApplicationRecord
  has_many :comment
  has_many :like
  belongs_to :user
end
