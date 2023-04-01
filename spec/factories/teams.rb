FactoryBot.define do

	factory :team do
    name { "team1" }
    association :company
  end

end