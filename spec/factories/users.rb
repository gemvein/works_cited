FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    admin { false }
  end
end
