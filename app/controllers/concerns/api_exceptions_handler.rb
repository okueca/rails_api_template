module ApiExceptionsHandler
  extend ActiveSupport::Concern

  included do
    around_action :handle_exceptions
  end

  def handle_exceptions
    yield
  rescue ActiveRecord::RecordNotFound => e
    handle_record_not_found(e)
  rescue ActiveModel::ValidationError, ActiveRecord::RecordInvalid, ArgumentError => e
    handle_validation_error(e)
  rescue ActionController::ParameterMissing => e
    handle_parameter_missing(e)
  rescue StandardError => e
    handle_standard_error(e)
  end

  private

  def handle_record_not_found(exception)
    render_error_response("Record not found for #{exception.model}", 404)
  end

  def handle_validation_error(exception)
    render_error_response(exception.message, 422)
  end

  def handle_parameter_missing(exception)
    render_error_response(exception.message, 400)
  end

  def handle_standard_error(exception)
    log_exception(exception) unless Rails.env.test?
    render_error_response(exception.message, 500)
  end

  def log_exception(exception)
    Rails.logger.error exception.class.to_s
    Rails.logger.error exception.to_s
    Rails.logger.error exception.backtrace.join("\n")
  end
end