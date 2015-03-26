Rails.application.routes.draw do
  resources :movies do


    post 'sort', on: :collection
    post 'rate'
    # post 'sort'
    # post 'rate'
  end


  root 'movies#index'



end
