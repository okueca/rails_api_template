# lib/json_response.rb

# frozen_string_literal: true

# For format json data
class JsonResponse
  attr_reader :success, :message, :data, :meta, :errors

  def initialize(options = {})
    @success = options[:success]
    @message = options[:message] || ''
    @data = options[:data] || []
    @meta = options[:meta] || []
    @errors = options[:errors] || []
  end

  def as_json(*)
    {
      success: @success,
      message: @message,
      data: @data,
      meta: @meta,
      errors: @errors
    }
  end
end