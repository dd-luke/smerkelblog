class Blog < ActiveRecord::Base
  belongs_to :user

  has_many :posts
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
end
