FactoryBot.define do
  factory :user do
    name { 'Edward' }
    email { 'edward@mail.com' }
    password { 'root123' }
    password_confirmation { 'root123' }
  end
end
