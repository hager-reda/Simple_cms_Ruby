Rails.application.routes.draw do

  namespace :api  do
    resources :subjects
    
  end


  resources :subjects
  # get 'subjects/index'
  # get 'subjects/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
