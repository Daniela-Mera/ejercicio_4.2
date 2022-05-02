Rails.application.routes.draw do
  resources :productos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "/", to:"productos#index"

  #Si cambio un link_to por un button_to, debo crear un post
  post "/productos/new", to:"productos#new"

  #Para el boton editar en la vista show, debo crear un get y un post
  get "/productos/:id/edit(.:format)",to:"productos#edit"
  post "/productos/:id/edit(.:format)", to:"productos#edit"
 
 
  # root "articles#index"
end
