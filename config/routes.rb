Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create] do
        resources :transactions
        resources :user_rewards, only: [:create] do
          collection do
            post :assign_rewards
          end
        end
      end
    end
  end
end