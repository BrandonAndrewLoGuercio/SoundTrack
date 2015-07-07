class Post < ActiveRecord::Base
  #validates_format_of :url, :with => /https\:\/\/(www\.youtube\.com|youtu\.be)\/.+/
  belongs_to :user
  has_many :comments
end
