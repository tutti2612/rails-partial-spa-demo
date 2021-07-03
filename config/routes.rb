Rails.application.routes.draw do
  root "users#index"
  resources :users
  resources :books, only: [:index]
  get 'books/*hoge', to: 'books#index'

  namespace 'api' do
    namespace 'v1' do
      resources :books
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
