# == Route Map (Updated 2014-02-20 19:18)
#
#                   Prefix Verb   URI Pattern                                            Controller#Action
#                     root GET    /                                                      welcome#index
#           company_venues POST   /companies/:company_id/venues(.:format)                venues#create
#        new_company_venue GET    /companies/:company_id/venues/new(.:format)            venues#new
#     company_performances GET    /companies/:company_id/performances(.:format)          performances#index
#                          POST   /companies/:company_id/performances(.:format)          performances#create
#  new_company_performance GET    /companies/:company_id/performances/new(.:format)      performances#new
# edit_company_performance GET    /companies/:company_id/performances/:id/edit(.:format) performances#edit
#      company_performance GET    /companies/:company_id/performances/:id(.:format)      performances#show
#                          PATCH  /companies/:company_id/performances/:id(.:format)      performances#update
#                          PUT    /companies/:company_id/performances/:id(.:format)      performances#update
#                companies POST   /companies(.:format)                                   companies#create
#              new_company GET    /companies/new(.:format)                               companies#new
#             edit_company GET    /companies/:id/edit(.:format)                          companies#edit
#                  company GET    /companies/:id(.:format)                               companies#show
#                          PATCH  /companies/:id(.:format)                               companies#update
#                          PUT    /companies/:id(.:format)                               companies#update
#                          DELETE /companies/:id(.:format)                               companies#destroy
#      performance_reviews GET    /performances/:performance_id/reviews(.:format)        reviews#index
#                          POST   /performances/:performance_id/reviews(.:format)        reviews#create
#   new_performance_review GET    /performances/:performance_id/reviews/new(.:format)    reviews#new
#       performance_review GET    /performances/:performance_id/reviews/:id(.:format)    reviews#show
#                    login GET    /login(.:format)                                       session#new
#                  session POST   /session(.:format)                                     session#create
#                          DELETE /session(.:format)                                     session#destroy
#             user_reviews GET    /users/:user_id/reviews(.:format)                      reviews#index
#         edit_user_review GET    /users/:user_id/reviews/:id/edit(.:format)             reviews#edit
#              user_review GET    /users/:user_id/reviews/:id(.:format)                  reviews#show
#                    users GET    /users(.:format)                                       users#index
#                          POST   /users(.:format)                                       users#create
#                 new_user GET    /users/new(.:format)                                   users#new
#                edit_user GET    /users/:id/edit(.:format)                              users#edit
#                     user GET    /users/:id(.:format)                                   users#show
#                          PATCH  /users/:id(.:format)                                   users#update
#                          PUT    /users/:id(.:format)                                   users#update
#                          DELETE /users/:id(.:format)                                   users#destroy
#

DanceshareApp::Application.routes.draw do

  root "welcome#index"
  
  # resources :user do
  resources :companies, except: [:index] do
    resources :venues, only: [:new, :create]
    resources :performances, except: [:destroy]
  end

  resources :performances, only: [] do
    resources :reviews, except: [:destroy] do
    end
  end

  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"

  # get "/users/:id/reviews", to: "reviews#index"
  # get "/users/:user_id/reviews/:id", to: "reviews#show"

  resources :users do
    resources :reviews, only: [:index, :show, :edit]
  end

end
