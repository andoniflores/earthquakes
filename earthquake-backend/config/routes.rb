Rails.application.routes.draw do
  namespace :api do
    resources :earthquakes, param: :id
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    get '/earthquakes', to: 'earthquakes#index'
    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
  end
  get 'up' => 'rails/health#show', as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"
end
