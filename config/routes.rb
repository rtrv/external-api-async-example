Rails.application.routes.draw do
  resources :cars, only: [] do
    member do
      get :mileage
      get :lock
      get :unlock
    end
  end
end
