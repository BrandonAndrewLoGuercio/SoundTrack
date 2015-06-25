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
    sequence(:message) { |n| "post#{n}" }
    # user_id @user
  end
end