Rails.application.routes.draw do
  apipie
  resources :requests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root to: "apipie/apipies#index"
end
