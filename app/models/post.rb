class Post < ActiveRecord::Base
  #validates_format_of :url, with: /^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/
  #validates_format_of :url, :with => /\A(https?\:\/\/)?(www\.)?(youtube\.com|youtu\.?be)\/.+\z/
end
