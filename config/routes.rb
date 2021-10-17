require 'sidekiq'
require 'sidekiq/web'
Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_interslice_session"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  post 'imports/', to: 'imports#create'
  get 'imports/', to: 'imports#index'

  get 'events/', to: 'events#index'
end
