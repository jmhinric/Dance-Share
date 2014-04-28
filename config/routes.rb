DanceshareApp::Application.routes.draw do

  resources :search_suggestions

  root "welcome#index"

  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"
  
  resources :users do
    # Delete resources :reviews
    resources :reviews, only: [:index, :show, :edit]
  end

  resources :companies, except: [:index] do
    # resources :venues, only: [:new, :create]
    resources :runs, except: [:destroy]
    resources :performances, except: [:destroy]
  end
  get "/companies/search", to: "companies#search"

  resources :runs, only: [:index, :new, :create] do
    resources :performances, only: [:new, :create]
  end
  # get "/runs/:id/performances/new", to: "performances#new"
  # post "/runs/:id/performances", to: "performances#create"

  resources :venues, only: [:new, :create]

  resources :performances, only: [] do
    resources :reviews, except: [:destroy] do
    end
  end



end
