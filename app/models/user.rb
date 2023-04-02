class User < ApplicationRecord

  # associations
  has_many :team_users
  has_many :teams, through: :team_users
  belongs_to :company

  # validations
  validates :email, presence: true, uniqueness: { scope: :company_id }
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates_associated :company
  validate :user_assigned_to_team_in_same_company 


  # devise authentication settings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def to_s
    "#{name} #{email} #{teams} #{company}"
  end

  private

  # checks if the user is assigned to a team of the same company
  def user_assigned_to_team_in_same_company
    teams.each do |team|
      if team.company_id != company_id
        errors.add(:team, "must belong to the same company as the user")
        break
      end
    end
  end
end
