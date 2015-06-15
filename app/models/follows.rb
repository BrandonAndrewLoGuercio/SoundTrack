class Follows < ActiveRecord::Base
  belongs_to :following, class: 'User'
  belongs_to :follower, class: 'User'
end
