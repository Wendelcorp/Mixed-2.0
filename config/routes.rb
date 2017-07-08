Rails.application.routes.draw do
  resources :mixes do
    resources :songs
  end
  root "mixes#index"
end
