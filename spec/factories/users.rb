FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end
  sequence :name do |name|
    "brad#{name}"
  end

  factory :user do
    email { generate(:email) }
    name {generate(:name) }
    last_name { "slater" }
    company
    team { association :team, company: company }
    password { "password" }
  end
end
  