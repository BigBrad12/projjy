FactoryBot.define do

  factory :company do
    name { "Celestial Cruises" }
  end

  trait :without_users do
    users { [] }
  end

  trait :with_users do
    users { build_list(:user, 2)}
  end
  
end