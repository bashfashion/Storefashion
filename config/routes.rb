Rails.application.routes.draw do
  root "products#index"

  resources :products, only: [ :index, :show ]

  get "/cart", to: "cart#index"
  post "/cart/add/:product_id", to: "cart#add", as: :add_to_cart
  delete "/cart/remove/:id", to: "cart#remove", as: :cart_remove
  post "set_currency/:currency", to: "products#set_currency", as: :set_currency

  get "/checkout", to: "cart#checkout", as: :checkout
  post "/send", to: "cart#send_order", as: :send_order

  get "/admin", to: "admin#index"
  get "/admin/new", to: "admin#new"
  post "/admin/create", to: "admin#create"
  get "/admin/edit/:id", to: "admin#edit", as: :edit_product
  patch "/admin/update/:id", to: "admin#update"
  delete "/admin/destroy/:id", to: "admin#destroy", as: :destroy_product
  post "/cart/increase/:id", to: "cart#increase", as: :cart_increase
  post "/cart/decrease/:id", to: "cart#decrease", as: :cart_decrease
  get "/order/success", to: "cart#success", as: :order_success

  get "/admin/categories", to: "categories#index"
  get "/admin/categories/new", to: "categories#new"
  post "/admin/categories", to: "categories#create"
  delete "/admin/categories/:id", to: "categories#destroy", as: :delete_category
  patch "/admin/update_rate", to: "admin#update_rate", as: :update_rate

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
