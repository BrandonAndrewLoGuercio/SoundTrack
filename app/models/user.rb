class User < ActiveRecord::Base
  # has_many :follower_through, class_name: 'Relationship', foreign_key: :follower_id, inverse_of: :follower
  # has_many :followed_through, class_name: "Relationship", foreign_key: :following_id, inverse_of: :following
  # has_many :posts
  # has_many :followers, through: :followed_through, source: :follower
  # has_many :followings, through: :follower_through, source: :following
  # has_many :followings_posts, through: :followings, source: :posts
  # has_many :posts_comments, through: :posts, source: :comments
  # has_many :comments
  # has_many :followings_comments, through: :followings_posts, source: :comments
  #
  # # has_one :headline
  #
  # attr_accessor :login
  #
  # # Include default devise modules. Others available are:
  # # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable, :omniauthable,
  #        :recoverable, :rememberable, :trackable, :validatable
  #
  #
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  # validates :username, presence: true, uniqueness: {case_sensitive: false}
  # validates :password, presence: true, on: create
  # mount_uploader :avatar, AvatarUploader
  #
  # def admin?
  #   admin
  # end
  #
  #
  # def login
  #   @login || self.username || self.email
  # end
  #
  # def login= login
  #   @login = login
  # end
  #
  # def self.search(username)
  #   if username
  #     username.downcase!
  #     where('LOWER(username) LIKE ?', "%#{username}%")
  #   else
  #     all
  #   end
  # end
  #
  # def followed_by(user)
  #   followers.include? user
  # end
  #
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email || "#{Devise.friendly_token[0,10]}@facebook.com"
  #     user.password = Devise.friendly_token[0,20]
  #     user.username = auth.info.name
  #     user.avatar = auth.info.image
  #     user.uid = auth.uid
  #     #user.oauth_token = auth.credentials.token
  #     #user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  #     user.provider= auth.provider
  #     user.save!
  #   end
  # end
  #
  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end
  #
  # User.find_each do |user|
  #   user.avatar.recreate_versions! if user.avatar?
  # end
  #
  # def self.find_for_database_authentication(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #   else
  #     conditions[:email].downcase! if conditions[:email]
  #     where(conditions.to_hash).first
  #   end
  # end
  #
  # def self.find_first_by_auth_conditions(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #   else
  #     if conditions[:username].nil?
  #       where(conditions).first
  #     else
  #       where(username: conditions[:username]).first
  #     end
  #   end
  # end


end
