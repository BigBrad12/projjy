class Company < ApplicationRecord
    has_many :users
    has_many :teams

    validates :name, presence: :true, length: { minimum: 2, maximum: 30 }
    validates :users, presence: :true

    def to_s
      "#{id} #{name}"
    end

    def all_teams
        self.teams
    end

    def all_users
        self.users
    end
end
