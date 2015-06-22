FactoryGirl.define do
  factory :user, :class => 'User' do
    sequence(:username) { |n| "foo#{n}" }
    password "foobar12"
    sequence(:email) {|n| "user#{n}@example.com"}
  end

  factory :post, :class => 'Post' do
    # user = create(:user)
    sequence(:message) { |n| "post#{n}" }
    # user_id user
  end

end