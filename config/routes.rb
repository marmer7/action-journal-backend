Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]
      resources :tasks, only: [:index, :create, :destroy]
      resources :editors, only: [:index, :create, :show]
      post "tasks/:id", to: "tasks#update"
      get "show_last_editor", to: "editors#show_last_editor"
      post "editors/:id", to: "editors#update"
    end
  end
end
