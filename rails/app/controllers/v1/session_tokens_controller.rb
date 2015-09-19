module V1
  class SessionTokensController < V1::BaseController
    prepend_before_filter :allow_params_authentication!, only: :create
    before_filter :authenticate_user!, except: [:create]

    def create
      user = warden.authenticate scope: :user, store: false
      if user
        token = JsonWebToken.encode 'user_id' => user.id
        render json: { session_token: token }, status: :created
      else
        render json: { error: 'Invalid email/password' }, status: :unauthorized
      end
    end
  end
end
