Rails.application.routes.draw do
  resources :students, only: [:create, :index, :show, :destroy]
  resources :instructors , only: [:create, :index, :show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
