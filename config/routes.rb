Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'customers#index'

  resources :customers do
    collection do
      get :search
      get :search_month
    end
  end
end
