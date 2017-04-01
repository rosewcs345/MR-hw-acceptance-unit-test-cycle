Rails.application.routes.draw do
  resources :movies do
    member do
      get 'same_director'
    end
  end
  
  root  'movies#index'
end
