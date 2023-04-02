class Team < ApplicationRecord
  belongs_to :company
  has_many :team_users
  has_many :users, through: :team_users

  validates :name, uniqueness: { scope: :company_id }, presence: true, length: { minimum: 2, maximum: 30 }
  validates :company, presence: true

  def all_users
    self.users
  end

  def to_s
    "#{name} (Company: #{company.name}, Users: #{users.map(&:name).join(', ')})"
  end
end
