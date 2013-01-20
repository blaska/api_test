ApiTest::Application.routes.draw do
  use_doorkeeper

  namespace :api do
    resources :javascripts
  end


  devise_for :users

  root :to => "home#index"
end
