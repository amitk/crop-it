Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"

  get '/ping' => "dashboard#ping"

  post "/link" => "links#create"
  get "/:code" => "links#show"
end
