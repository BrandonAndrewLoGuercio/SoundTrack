class User < ActiveRecord::Base
  has_many :follower_through, class_name: 'Relationship', foreign_key: :follower_id, inverse_of: :follower
  has_many :followed_through, class_name: "Relationship", foreign_key: :following_id, inverse_of: :following

  has_many :followers, through: :followed_through, source: :follower
  has_many :followings, through: :follower_through, source: :following

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # validates_uniqueness_of :username
  validates_presence_of :username
  mount_uploader :avatar, AvatarUploader

  def self.search(username)
    if username
      username.downcase!
      where('LOWER(username) LIKE ?', "%#{username}%")
    else
      all
    end
  end

  def followed_by(user)
    followers.include? user
  end
end
