class User < ActiveRecord::Base
  has_many :blogs
  has_many :posts
  has_many :comments
  has_one :profile

  delegate :full_name, to: :profile, allow_nil: true

end
