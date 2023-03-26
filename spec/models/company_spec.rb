require 'factory_bot_rails'
require 'rails_helper'

RSpec.describe Company, type: :model do

  it "has a valid factory" do
    expect(build(:company)).to be_valid
  end
  
  it "is invalid without a name" do
    company = build(:company, name: nil)
    expect(company).not_to be_valid
  end
  
  it "has many users" do
    company = create(:company)
    user1 = create(:user, company: company )
    user2 = create(:user, company: company )
    expect(company.users.count).to eq(2)
  end

end
