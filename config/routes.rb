Rails.application.routes.draw do
  root to: "quotes#index"
  resources :quotes, only: [:create, :index] do
    resources :reviews, only: :create
  end
end
