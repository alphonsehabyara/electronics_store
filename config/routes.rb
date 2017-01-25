Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/electronics", to: 'electronics#index'
  get "/electronics/new", to: 'electronics#new'
  get "/electronics/:id", to: 'electronics#show'
  post "/electronics", to: 'electronics#create'
  get "/electronics/:id/edit", to: 'electronics#edit'
  patch "/electronics/:id", to: 'electronics#update'
  delete "/electronics/:id", to: 'electronics#destroy'

end
