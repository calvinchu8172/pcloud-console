FactoryGirl.define do

  factory :user do
    password '12345678'
    password_confirmation '12345678'

    trait :super_admin do
      email 'super_admin@example.com'
    end

    trait :confirmed do
      confirmed_at Time.now
    end

    factory :super_admin, traits: [:super_admin, :confirmed] do
      after(:create) do |user|
        user.super_admin!
      end
    end
  end
end
