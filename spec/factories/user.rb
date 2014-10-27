FactoryGirl.define do
  factory :user do
    name "Test User"
    email "test@example.com"
    password "helloworld"
    password_confirmation "helloworld"
  end
end
