Rails.application.routes.draw do
  root to: 'home#index'
  get '/home/index' => 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/links" => 'links#create'

  # this functions as a catch all. this is not a good implementation as it will
  # break the public pages in public directory
  get "/:lookup_code" => 'links#show'
end
