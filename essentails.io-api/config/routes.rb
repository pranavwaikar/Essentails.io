Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :consumers, :serviceproviders, :services, :orders, :orderitems

      post '/services/create_service_for_provider', to: 'services#create_service_for_provider'
      get '/serviceproviders/show_my_services/:id', to: 'serviceproviders#show_my_services'
      post '/consumers/show_serviceproviders', to: 'consumers#show_serviceproviders'
      get '/serviceproviders/get_orders/:id', to: 'serviceproviders#get_orders'
      get '/consumers/get_orders/:id', to: 'serviceproviders#get_orders'
      get '/orders/get_order_items/:id', to: 'orders#get_order_items'
     
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
