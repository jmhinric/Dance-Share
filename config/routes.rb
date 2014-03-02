DanceshareApp::Application.routes.draw do

  root "welcome#index"
  
  resources :companies, except: [:index] do
    # resources :venues, only: [:new, :create]
    resources :runs, except: [:destroy]
    resources :performances, except: [:destroy]
  end

  resources :venues, only: [:new, :create]

  resources :performances, only: [] do
    resources :reviews, except: [:destroy] do
    end
  end

  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"

  resources :users do
    resources :reviews, only: [:index, :show, :edit]
  end

end
