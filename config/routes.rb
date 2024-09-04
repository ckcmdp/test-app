Rails.application.routes.draw do
  namespace :api do
    post 'login', to: 'authentication#login'
    post 'register', to: 'users#register'

    resources :tasks, only: [:create] do
      member do
        post 'assign'
        patch 'complete'
      end

      collection do
        get 'assigned'
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
