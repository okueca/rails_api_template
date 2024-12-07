class ApplicationController < ActionController::API
  include ApiResponseHandler
  include ApiExceptionsHandler
end
