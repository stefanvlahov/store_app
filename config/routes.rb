Rails.application.routes.draw do
  get "/" => "products#index"
  get "/cars" => "products#index"

  get "/cars/new" => "products#new"
  post "/cars" => "products#create"

  get "/cars/:id" => "products#show"

  get "/cars/:id/edit" => "products#edit"
  patch "/cars/:id" => "products#update"

  delete "/cars/:id" => "products#destroy"
end
