Rails.application.routes.draw do
  root "home#index"
  resources :notes

  resources :auth, only: [:index, :new]
  post "/auth/signup" => "auth#signup"
  post "/auth/signin" => "auth#signin"
end
