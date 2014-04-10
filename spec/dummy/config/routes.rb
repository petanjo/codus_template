Rails.application.routes.draw do
  namespace :barnie do
    resources :users
  end
end
