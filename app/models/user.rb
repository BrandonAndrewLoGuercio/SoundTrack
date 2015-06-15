class User < ActiveRecord::Base
  has_many :follower_through, class_name: 'Follow', foreign_key: :follower_id, inverse_of: :follower
  has_many :followed_through, class_name: "Follow", foreign_key: :following_id, inverse_of: :following

  has_many :followers, through: :followed_through, source: :follower
  has_many :followings, through: :follower_through, source: :following
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
