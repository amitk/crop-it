Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"

  get '/ping' => "dashboard#ping"
  
  # routes regarding world data
  namespace "countries" do
    get '/index', action: :index
  end

  post "/link" => "links#create"
  get "/:code" => "links#show"

end
