Rails.application.routes.draw do
  scope '/v1' do
    devise_for :users, skip: [:sessions]
  end

  namespace :v1 do
    resources :samples, only: [:index]
    resource :users, only: [] do
      collection do
        post 'validate'
      end

      resource :session_token, only: [:create]
    end
  end
end
