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

  factory :working_time do
    user
    project    
    time 1.5
    date "2015/4/1"
    
    factory :apploval do
      admin true
    end
  end
end