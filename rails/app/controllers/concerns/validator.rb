module Concerns
  module Validator
    def validate
      model_class = controller_name.classify.constantize
      model_params = send "#{controller_name.singularize}_params"
      model = model_class.new model_params
      model.valid?
      render json: { errors: model.errors }, status: 200
    end
  end
end
