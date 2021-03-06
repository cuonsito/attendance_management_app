FactoryGirl.define do
  factory :user do
    sequence(:username)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "password"
  end

  factory :project do
    sequence(:name)  { |n| "Project #{n}" }
  end

  factory :member do
    user
    project
    assain_rate 0.1

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