class Post < ActiveRecord::Base
  #validates_format_of :url, with: /^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/
  validates_format_of :url, :with => /https\:\/\/(www\.youtube\.com|youtu\.be)\/.+/
  belongs_to :user

end
