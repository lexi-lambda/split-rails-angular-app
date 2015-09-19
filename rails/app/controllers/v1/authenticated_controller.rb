module V1
  class AuthenticatedController < V1::BaseController
    before_filter :authenticate_user!
  end
end
