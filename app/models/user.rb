class User < ApplicationRecord

  # associations
  belongs_to :team
  belongs_to :company

  validates :email, presence: true, uniqueness: { scope: :company_id }
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates_associated :company

  # devise authentication settings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

end
