DanceshareApp::Application.routes.draw do

  resources :search_suggestions, only: :index

  root "welcome#index"

  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"
  
  resources :users, except: [:index]

  resources :companies, except: [:index] do
    resources :runs, except: [:index]
    resources :venues, only: [:new, :create]
  end

  get "/companies/search", to: "companies#search"

  resources :runs, only: [] do
    resources :performances, only: [:new, :create, :update, :destroy]
  end
  
  # resources :venues, only: [:new, :create]

  get "/venues/get_venues", to: "venues#get_venues"

  resources :performances, only: [] do
    resources :reviews, except: [:index] do
    end
  end

  post "reviews/:id/review_votes", to: "review_votes#create"

  resources :videos, only: [:index, :show]

end
