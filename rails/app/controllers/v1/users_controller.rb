module V1
  class UsersController < V1::BaseController
    include Concerns::Validator

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
end
