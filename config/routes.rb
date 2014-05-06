DanceshareApp::Application.routes.draw do

  resources :search_suggestions

  root "welcome#index"

  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"
  
  resources :users, except: [:index]

  resources :companies, except: [:index] do
    resources :runs, except: [:index]
    # resources :performances, except: [:destroy]
  end
  
  get "/companies/search", to: "companies#search"

  # resources :runs, only: [:index, :new, :create] do
  #   resources :performances, only: [:new, :create]
  # end
  # get "/runs/:id/performances/new", to: "performances#new"
  # post "/runs/:id/performances", to: "performances#create"

  resources :venues, only: [:new, :create]

  resources :performances do
    resources :reviews do
    end
  end



end
