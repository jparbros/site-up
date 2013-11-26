require 'sidekiq/web'

SiteUp::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  
  resources :sites do
    resources :statuses
  end
  
  mount Sidekiq::Web, at: '/sidekiq'

end
