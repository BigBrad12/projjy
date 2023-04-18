FactoryBot.define do

  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    email { generate(:email) }
    name { "Brad" }
    last_name { "Slater" }
    password { "password" }
  end
end
  