class User < ApplicationRecord

  # associations
  belongs_to :team, optional: true
  belongs_to :company

  # validations
  validates :email, presence: true, uniqueness: { scope: :company_id }
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates_associated :company
  validate :user_assigned_to_one_company
  validate :user_assigned_to_team_in_same_company

  # devise authentication settings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  private
  
  #looking for user with same email and different company id
  def user_assigned_to_one_company
    if User.where(email: email.where.not(company_id: company_id).exists?)
      errors.add(:email, "is already assigned to another company")
    end
  end

  # checks if the user is assigned to a team of the same company
  def user_assigned_to_team_in_same_company
    if team.present? && team.company_id != company_id
      errors.add(:team, "must belong to the same company as the user")
    end
  end
end
