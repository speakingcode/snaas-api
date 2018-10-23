module Api::V1
  class ApiController < ApplicationController
    include ActionController::MimeResponds
    # Generic API stuff here
    before_action :authenticate

    protected

    # Authenticate the user with token based authentication
    def authenticate
      authenticate_api_key || render_unauthorized
    end

    def authenticate_api_key
      authenticate_with_http_token do |token, options|
        @api_key = ApiKey.find_by(api_key: token)
      end
    end

    def render_unauthorized(realm = "Application")
      self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
      render json: 'Invalid client token.', status: :unauthorized
    end
  end
end
