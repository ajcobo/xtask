FactoryGirl.define do
  factory :mutant do
    confirmed_at Time.now
    name "Test Mutant"
    email "test@example.com"
    password "please123"

    trait :admin do
      role 'admin'
    end

  end
end