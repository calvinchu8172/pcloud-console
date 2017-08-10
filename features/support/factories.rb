FactoryGirl.define do

  factory :user do
    password '12345678'
    password_confirmation '12345678'

    trait :super_admin do
      email 'super_admin@example.com'
    end

    trait :system_manager do
      email 'system_manager@example.com'
    end

    trait :confirmed do
      confirmed_at Time.now
    end

    factory :super_admin, traits: [:super_admin, :confirmed] do
      after(:create) do |user|
        user.super_admin!
        user.bind_omniauth_service(OpenStruct.new(
          provider: 'cucumber',
          uid: user.cloud_id,
          info: OpenStruct.new
        ))
      end
    end

    factory :system_manager, traits: [:system_manager, :confirmed] do
      after(:create) do |user|
        group = Group.find_by(name: 'System Management')
        user.groups << group
        user.bind_omniauth_service(OpenStruct.new(
          provider: 'cucumber',
          uid: user.cloud_id,
          info: OpenStruct.new
        ))
      end
    end
  end
end
