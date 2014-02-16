DanceshareApp::Application.routes.draw do

  root "welcome#index"
  
  resources :users do
    resources :performances, except: [:destroy]
  end

  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"

end
