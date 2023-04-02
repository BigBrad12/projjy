FactoryBot.define do

  sequence :name do |t|
    "team#{t}"
  end

  factory :team do
    name { generate(:name) }
  end

end