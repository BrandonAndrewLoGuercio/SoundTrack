FactoryGirl.define do
  factory :user, :class => 'User' do
    sequence(:username) { |n| "foo#{n}" }
    password "foobar12"
    email { "#{username}@example.com" }
  end

end