FactoryBot.define do

	factory :team do
    name { "team1" }
    company { association :company }
  end

end