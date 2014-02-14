DanceshareApp::Application.routes.draw do

  root "welcome#index"

  resources :users do
  end

end
