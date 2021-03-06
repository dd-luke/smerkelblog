class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog

  has_many :comments, as: :commentable
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
end
