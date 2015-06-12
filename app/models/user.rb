class User < ActiveRecord::Base
  has_many :follows
  has_many :followers, through: :follows, class_name: 'User', source: :follower
  has_many :followings, through: :follows, class_name: 'User', source: :following
end
