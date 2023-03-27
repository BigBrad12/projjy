FactoryBot.define do

  factory :company do
    name { "Example" }
  end

  trait :without_users do
    users { [] }
  end

  after(:create) do |company|
    create_list(:user, 2, :with_company, company: company)
    create(:team, company: company)
  end
  
end