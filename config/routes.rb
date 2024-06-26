Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :robots do
    member do
      post "assign_tasks", to: "tasks#assign_tasks"
      post "complete_tasks", to: "tasks#complete_tasks"
    end
  end

  resources :tasks
  resources :leaderboards, only: [:index]
  root "robots#index"

  namespace :api, defaults: { format: "json" } do
    resources :robots, only: [:create]
  end
end
