class User < ActiveRecord::Base
  has_many :follower_through, class_name: 'Relationship', foreign_key: :follower_id, inverse_of: :follower
  has_many :followed_through, class_name: "Relationship", foreign_key: :following_id, inverse_of: :following
  has_many :posts
  has_many :followers, through: :followed_through, source: :follower
  has_many :followings, through: :follower_through, source: :following

  has_one :headline

  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, on: create
  mount_uploader :avatar, AvatarUploader

  def login
    @login || self.username || self.email
  end

  def login= login
    @login = login
  end

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

  User.find_each do |user|
    user.avatar.recreate_versions! if user.avatar?
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_hash).first
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end


end
