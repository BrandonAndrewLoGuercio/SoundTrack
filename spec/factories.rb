FactoryGirl.define do
  factory :user, :class => 'User' do
    sequence(:username) { |n| "foo#{n}" }
    password "foobar12"
    sequence(:email) { |n| "user#{n}@example.com"}
    avatar 'avatar.png'
  end

  factory :post, :class => 'Post' do
    # before each :post do
    #   @user = create(:user)
    # end
    # add video_id and title
    sequence(:description) { |n| "description#{n}" }
    # user_id @user
  end
end