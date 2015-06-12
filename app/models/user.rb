class User < ActiveRecord::Base
  has_many :follows
  has_many :posts
  has_many :followers, through: :follows, class_name: 'User', source: :follower
  has_many :followings, through: :follows, class_name: 'User', source: :following
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :username
end
