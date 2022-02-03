Rails.application.routes.draw do
  resources :cars, only: [] do
    member do
      get :mileage
    end
  end
end
