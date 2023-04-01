FactoryBot.define do

  factory :company do
    name { "Example" }
  end

  trait :without_users do
    users { [] }
  end

  trait :with_users do
    users { build_list(:user, 2) }
  end
  
end