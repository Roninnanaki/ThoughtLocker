FactoryGirl.define do
  factory :user do
    name     "user"
    email    "user@example.com"
    password "foobar10"
    password_confirmation "foobar10"
  end
end