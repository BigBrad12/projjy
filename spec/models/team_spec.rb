require 'factory_bot_rails'
require 'rails_helper'

RSpec.describe Team, type: :model do

  it "has to be part of a company" do
    # company = build(:company, :with_users)
    team = build(:team, company: nil)
    expect(team).to_not be_valid
  end

  it "is valid if its part of a company" do
    company = build(:company, :with_users)
    team = build(:team, company: company)
    expect(team).to be_valid
  end

  it "can't have two teams with the same name in the same company" do
    company = build(:company, :with_users)
    team = build(:team, company: company, name: "Same")
    team1 = build(:team, company: company, name: "Same")
    team.save
    team1.save
    expect(team1).to_not be_valid
  end

  it "can have two teams with the same name in different companies" do
    company = build(:company, :with_users)
    company.save
    team = build(:team, company: company, name: "Same")
    team.save
    company1 = build(:company, :with_users)
    company1.save
    team1 = build(:team, company: company1, name: "Same")
    team1.save
    expect(team).to be_valid
    expect(team1).to be_valid
  end

end