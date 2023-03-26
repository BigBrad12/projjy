class Project < ApplicationRecord
   has_many :users through :ProjectUser
   has_many :teams through :TeamProject
end
