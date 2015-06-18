class User < ActiveRecord::Base
  has_many :follower_through, class_name: 'Relationship', foreign_key: :follower_id, inverse_of: :follower
  has_many :followed_through, class_name: "Relationship", foreign_key: :following_id, inverse_of: :following

  has_many :followers, through: :followed_through, source: :follower
  has_many :followings, through: :follower_through, source: :following

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]
  # validates_uniqueness_of :username

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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name
      user.avatar = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
