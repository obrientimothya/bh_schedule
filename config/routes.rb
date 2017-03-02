Rails.application.routes.draw do
  resources :schedules do
    collection do
      post :import
    end
  end
  root to: 'schedules#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
