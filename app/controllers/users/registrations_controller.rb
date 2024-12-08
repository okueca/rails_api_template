# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include ApiExceptionsHandler
  include ApiResponseHandler
  include RackSessionsFix
  respond_to :json
  private
  def respond_with(current_user, _opts = {})
    if resource.persisted?
      render_success_response(data: UserSerializer.new(current_user).serializable_hash[:data][:attributes], message: 'Signed up successfully.')
    else
      render json: {
        status: {message: "User couldn't be created successfully. #{current_user.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end
end
