Rails.application.routes.draw do
  # this sets the server page to the desired root/catagorgy
  root to: 'cocktails#index'
  resources :cocktails, only: [ :index, :show, :new, :create ] do
    resources :doses, only: [ :new, :create ]
  end
  resources :doses, only: [ :destroy ]
end
