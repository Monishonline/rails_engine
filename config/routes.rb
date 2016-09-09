Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
        namespace :merchants do
          get 'find',         to: 'search#show'
          get 'find_all',     to: 'search#index'
          get 'random',       to: 'random#show'
          get ':id/invoices', to: 'invoices#index'
          get ':id/items',    to: 'items#index'
          get ':id/revenue',  to: 'revenues#show'
          get 'most_items',   to: 'sold_items#show'
          get ':id/customers_with_pending_invoices', to: 'customers_with_pending_invoices#show'
          get ':id/favorite_customer', to: 'favorite_customer#show'
          get 'most_revenue',          to: 'most_revenue#show'
        end
        namespace :customers do
          get 'find',                  to: 'search#show'
          get 'find_all',              to: 'search#index'
          get 'random',                to: 'random#show'
          get ':id/transactions',      to: 'transactions#index'
          get ':id/invoices',          to: 'invoices#index'
          get ':id/favorite_merchant', to: 'merchants#show'
        end
        namespace :transactions do
          get 'find',        to: 'search#show'
          get 'find_all',    to: 'search#index'
          get 'random',      to: 'random#show'
          get ':id/invoice', to: 'invoices#show'
        end
        namespace :items do
          get 'find',              to: 'search#show'
          get 'find_all',          to: 'search#index'
          get 'random',            to: 'random#show'
          get ':id/invoice_items', to: 'invoice_items#index'
          get ':id/merchant',      to: 'merchants#show'
          get ':id/best_day',      to: 'sales#show'
          get 'most_items',        to: 'sold_items#show'
          get 'most_revenue',      to: 'most_revenue#show'
        end
        namespace :invoices do
          get 'find',              to: 'search#show'
          get 'find_all',          to: 'search#index'
          get 'random',            to: 'random#show'
          get ':id/transactions',  to: 'transactions#index'
          get ':id/invoice_items', to: 'invoice_items#index'
          get ':id/items',         to: 'items#index'
          get ':id/customer',      to: 'customers#show'
          get ':id/merchant',      to: 'merchants#show'
        end
        namespace :invoice_items do
          get 'find',        to: 'search#show'
          get 'find_all',    to: 'search#index'
          get 'random',      to: 'random#show'
          get ':id/invoice', to: 'invoices#show'
          get ':id/item',    to: 'items#show'
        end
      resources :merchants,     only: [:index, :show]
      resources :customers,     only: [:index, :show]
      resources :transactions,  only: [:index, :show]
      resources :items,         only: [:index, :show]
      resources :invoices,      only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
