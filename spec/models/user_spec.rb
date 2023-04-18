require 'factory_bot_rails'
require 'rails_helper'

RSpec.describe User, type: :model do

  it "has to have a valid email" do
    company = build(:company)
    user = build(:user, email: "sdfgsdfg.com")
    company.users = [user]
    expect(user).to_not be_valid
  end

  it "must be part of a company" do
    user = build(:user)
    expect(user).to_not be_valid
  end

  it "is valid with all valid fields and a company association" do
    company = build(:company)
    user = build(:user)
    company.users = [user]
    expect(user).to be_valid
  end

  it "has unique email address" do
    company = build(:company)
    user = build(:user, email: "test@example.com")
    user1 = build(:user, email: "test@example.com")
    company.users = [user]
    user.save
    company.save
    user1.company = company
    expect(user).to be_valid
    expect(user1).to_not be_valid
  end

  it "can be a part of two teams" do
    company = create(:company, :with_users)
    team = create(:team, company: company)
    team1 = create(:team, company: company)
    user = create(:user, company: company)
       
    user.teams = [team, team1]
    user_teams = user.teams

    puts "User #{user.name} is a member of the following teams: "
    user.teams.each do |t|
      puts "#{t.name}"
    end

    expect(user).to be_valid
  end

  it "can't be part of the same team twice" do
    company = build(:company)
    team = build(:team, company: company)
    user = build(:user, company: company)
    
    company.users = [user]
    company.save

    expect { user.teams = [team, team] }.to raise_error(ActiveRecord::RecordInvalid, /Validation failed: Team has already been taken/)
  end

end