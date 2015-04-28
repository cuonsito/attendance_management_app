FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "password"
  end

  factory :project do
  	name "project"
  end

  factory :member do
    user
    project
    assain_rate 0.5

    factory :admin do
      admin true
    end
  end
end