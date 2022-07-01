FactoryBot.define do
  factory :user do
    name { 'Edward Oluyara' }
    email { 'edward@gmail.com' }
    password { 'root123' }
    password_confirmation { 'root123' }

    trait :confirmed do
      confirmed_at { Time.zone.now }
      confirmation_sent_at { Time.zone.now }
      confirmation_token { '12345' }
    end
  end
end
