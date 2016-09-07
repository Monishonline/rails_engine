Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 # get 'api/v1/merchants/find' => 'api/v1/merchants/search#show'
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
        namespace :merchants do
          get 'find',     to: 'search#show'
          get 'find_all', to: 'search#index'
          get 'random',   to: 'random#show'
        end
        namespace :customers do
          get 'find',     to: 'search#show'
          get 'find_all', to: 'search#index'
          get 'random',   to: 'random#show'
        end
        namespace :transactions do
          get 'find',     to: 'search#show'
          get 'find_all', to: 'search#index'
          get 'random',   to: 'random#show'
        end
      resources :merchants, only: [:index, :show]  
      resources :customers, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end

end
