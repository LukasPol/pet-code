class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  # Config Devise
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:full_name])
    end

  private
    def authentication_token
      request.headers['Authorization']
    end

    def authenticate_user
      user = User&.find_by_authentication_token(authentication_token)
      if user && authentication_token.present?
        @current_user = user
      else
        render json: {
          errors: I18n.t(:unauthenticated, scope: 'devise.failure')
        }, status: :unauthorized
      end
    end

    def context
      { user: @current_user }
    end
end
