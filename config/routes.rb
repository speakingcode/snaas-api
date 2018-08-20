Rails.application.routes.draw do
  root to: "users#index"

  namespace :api do
    namespace :v1 do
      resources :albums,
                :defaults => {format: :json}

      resources :nicknames,
                :defaults => {format: :json}
    end
  end
end
