module V1
  class SamplesController < V1::AuthenticatedController
    def index
      render json: { samples: %w(a b c) }
    end
  end
end
