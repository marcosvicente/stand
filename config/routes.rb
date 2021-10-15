Rails.application.routes.draw do
  post 'imports/', to: 'imports#create'
  get 'events/', to: 'events#index'
end
