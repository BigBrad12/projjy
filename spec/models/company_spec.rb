require 'factory_bot_rails'
require 'rails_helper'

RSpec.describe Company, type: :model do

  it "needs to have a user assigned" do
    expect(build(:company, :without_users)).not_to be_valid
  end
  
  it "needs a name" do
    company = build(:company, name: nil)
    expect(company).not_to be_valid
  end

  it "can have many users" do
    company = build(:company)
    users = build_list(:user, 5, company: company)
  
    # Associate the users with the company
    company.users = users
    # Save the company and its associated users
    company.save
  
    expect(company.users.count).to eq(5)
  end
  
  it "can have many teams" do
    company = build(:company)
    users = build_list(:user, 5, company: company)
    company.users = users
    teams = build_list(:team, 5, company: company)
    company.teams = teams
    company.save

    expect(company).to be_valid
  end

end
