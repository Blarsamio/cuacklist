Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create, :add_to_list]
    resources :reviews, only: :create
  end
  resources :bookmarks, only: [:destroy, :edit, :show, :add_to_list]
  resources :reviews, only: :destroy
  resources :movies, only: [:index, :show]
  resources :favourites, only: [:show] do
    resources :bookmarks, only: [:new, :create]
  end
  get "all", to: "lists#all"
end
