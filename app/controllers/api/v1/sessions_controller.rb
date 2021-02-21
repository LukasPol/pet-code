class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]
  before_action :set_user, only: [:create]

  def create
    if (not @user.nil?) && valid_password?
      response.set_header('Authorization', @user.authentication_token)
      render json: {
        'Authorization': @user.authentication_token, 
        'id': @user.id,
        'full_name': @user.full_name,
        'email': @user.email
      }, status: :created
    else
      render json: {
        errors: I18n.t(:invalid, scope: 'devise.failure')
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @current_user.authentication_token = nil
    @current_user.save
    head :no_content
  end

  private
    def set_user
      @user = User.find_by(email: params.dig(:email))
    end

    def valid_password?
      @user&.valid_password?(params.dig(:password))
    end
end