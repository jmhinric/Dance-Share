DanceshareApp::Application.routes.draw do

  resources :search_suggestions, only: :index

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

  resources :runs, only: [] do
    resources :performances, only: [:new, :create, :update, :destroy]
  end
  
  resources :venues, only: [:new, :create]

  resources :performances, only: [] do
    resources :reviews do
      member { post :vote }
    end
  end



end
