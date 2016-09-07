Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
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
        namespace :items do
          get 'find', to: 'search#show'
          get 'find_all', to: 'search#index'
          get 'random', to: 'random#show'
        end
        namespace :invoices do
          get 'find', to: 'search#show'
          get 'find_all', to: 'search#index'
          get 'random', to: 'random#show'
        end
        namespace :invoice_items do
          get 'find', to: 'search#show'
          get 'find_all', to: 'search#index'
          get 'random', to: 'random#show'
        end
      end
      resources :merchants, only: [:index, :show]  
      resources :customers, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
  end
end
