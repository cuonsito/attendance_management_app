FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "password"

    factory :admin do
      admin true
    end
  end

  factory :project do
  	name "project1"
  	user
  end
end