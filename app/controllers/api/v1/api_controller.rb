module Api::V1
  class ApiController < ApplicationController
    include ActionController::MimeResponds

    include ActionController::HttpAuthentication::Token::ControllerMethods

    # Generic API stuff here
    before_action :authenticate_api_client

    protected

    # Authenticate the user with token based authentication
    def authenticate_api_client
      authenticate_api_key || render_unauthorized
    end

    def authenticate_api_key
        api_key = request.headers['X-Api-Key'] || params['api_key']
        @api_key = ApiKey.find_by(api_key: api_key)
    end

    def render_unauthorized(realm = "Application")
      self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
      render json: 'Invalid client token.', status: :unauthorized
    end
  end
end
