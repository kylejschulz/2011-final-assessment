Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors, only: [:index]
  resources :surgerys, only: [:show, :index] do
    resources :surgery_doctors, only: [:create]
  end
end
