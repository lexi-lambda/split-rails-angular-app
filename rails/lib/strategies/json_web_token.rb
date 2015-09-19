module Strategies
  class JsonWebToken < Devise::Strategies::Base
    def valid?
      request.headers['Authorization'].present?
    end

    def authenticate!
      return fail! unless claims && resource
      success! resource
    end

    private

    def claims
      return @claims if defined? @claims
      @claims =
        begin
          (auth_header = request.headers['Authorization']) &&
          (token = auth_header.split(' ').last) &&
          (::JsonWebToken.decode token)
        rescue
          nil
        end
    end

    def resource
      return @resource if defined? @resource
      @resource = mapping.to.find_by_id(claims["#{mapping.name}_id"])
    end
  end
end
