class TeamUser < ApplicationRecord
  
  #associations
  belongs_to :team
  belongs_to :user

  #validations
  validates :team_id, uniqueness: { scope: :user_id }
  
end