require 'factory_bot_rails'
require 'rails_helper'

RSpec.describe Company, type: :model do

  it "is invalid if zero users" do
    expect(build(:company, :without_users)).not_to be_valid
  end
  
  it "company invalid without a name" do
    company = build(:company, name: nil)
    expect(company).not_to be_valid
  end

  it "has many users" do
    company = build(:company)
    users = build_list(:user, 5, company: company)
  
    # Associate the users with the company
    company.users = users
    # Save the company and its associated users
    company.save
  
    expect(company.users.count).to eq(5)
  end
  
  it "has many teams" do
    company = build(:company)
    users = build_list(:user, 5, company: company)
    company.users = users
    teams = build_list(:team, 5, company: company)
    company.teams = teams
    company.save

    expect(company).to be_valid
  end

end
