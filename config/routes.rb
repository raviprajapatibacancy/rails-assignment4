Rails.application.routes.draw do
  resources :users do
    member do
      post 'user/update_status'
    end
  end
  match 'user/update_status' => 'users#update_status', :via => :get

  namespace :api do
    namespace :v1 do
      resources :users do
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
