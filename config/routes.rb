Rails.application.routes.draw do
  devise_for :users
  resources :mixes, :path => "mixtape" do
    resources :songs
  end
  root "mixes#index"
end
