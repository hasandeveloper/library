Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resource :orders, only: [:checkout] do
        post 'checkout'
      end
    end
  end

  devise_for :users,
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  
  namespace :api do
    namespace :v1 do
      resources :libraries do
        resources :books, only: [:index]
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :books
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
