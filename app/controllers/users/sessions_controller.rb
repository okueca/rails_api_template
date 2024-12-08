# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include ApiResponseHandler
  include RackSessionsFix
  respond_to :json
  # Override the create method to handle login attempt
  def create
    self.resource = warden.authenticate(auth_options)
    if resource && resource.persisted?
      # Successfully logged in
      render json: {
        status: 200,
        message: 'Logged in successfully.',
        data: { user: UserSerializer.new(current_user).serializable_hash[:data][:attributes] }
      }, status: :ok
    else
      # Failed login
      render json: {
        status: 401,
        message: "Invalid Email or password."
      }, status: :unauthorized
    end
  rescue StandardError => e
    # Handle any errors during authentication
    render json: { message: "Something went wrong: #{e.message}" }, status: :unauthorized
  end

  private
  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      begin
        # Decode the JWT and fetch the payload
        jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last, Rails.application.credentials.devise_jwt_secret_key!).first
        current_user = User.find(jwt_payload['sub'])
      rescue JWT::ExpiredSignature, JWT::VerificationError => e
        e.message
      rescue JWT::DecodeError, JWT::VerificationError => e
        e.message
      end
    end
    
    if current_user
      render json: {
        status: 200,
        message: 'Logged out successfully.'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
