class Team < ApplicationRecord
  belongs_to :company
  has_many :users

  validates :name, uniqueness: { scope: :company_id }, presence: true, length: { minimum: 2, maximum: 30 }
  validates :company, presence: true
end
