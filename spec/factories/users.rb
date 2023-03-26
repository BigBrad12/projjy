FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    email { generate(:email) }
    name { "brad" }
    last_name { "slater" }
    company
    team { association :team, company: company }
    password { "password" }
  end
end
  