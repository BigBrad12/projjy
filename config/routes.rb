Rails.application.routes.draw do
  
  # authentication routes
  devise_for :users
  
  # home root
  root "home#index"

  # adding viewing and editing teams within a company, adding viewing and editing users within a company
  resources :companies do
    resources :teams, only: [:show, :edit, :create]
    resources :users, only: [:show, :edit, :create]
  end

  # adding users to teams and projects to teams
  resources :teams do
    resources :users, only: [:index, :new, :create]
    resources :team_projects, only: [:index, :new, :create, :destroy]
  end

  #  users can view projects
  resources :users do
    resources :projects, only: [:index]
  end

  # adding viewing and removing users to projects
  resources :projects do 
    resources :project_users, only: [:index, :new, :create, :destroy]
  end
end
