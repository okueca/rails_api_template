# lib/json_response.rb

# frozen_string_literal: true

# For format json data
class JsonResponse
  attr_reader :success, :message, :data, :meta, :errors

  def initialize(options = {})
    @message = options[:data][:message] || ""
    @data = options[:data][:data] || []
    @meta = options[:data][:meta] || []
    @errors = options[:data][:errors] || []
  end

  def as_json(*)
    {
      message: @message,
      data: @data,
      meta: @meta,
      errors: @errors
    }
  end
end