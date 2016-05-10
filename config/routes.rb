Rails.application.routes.draw do
  get "/cars" => "products#selection"
end
