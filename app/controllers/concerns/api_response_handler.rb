module ApiResponseHandler
  extend ActiveSupport::Concern

  def json_response(options = {}, status = 500)
    render json: JsonResponse.new(options), status: status
  end

  def render_error_response(error, message = '', status = 422)
    json_response({
                    success: false,
                    message: message,
                    errors: error
                  }, status)
  end

  def render_success_response(data = {}, message = '', meta = {}, status = 200)
    json_response({
                    success: true,
                    message: message,
                    data: data,
                    meta: meta_attributes(meta)
                  }, status)
  end
  
  # will be used for paginations
  def meta_attributes(collection, extra_meta = {})
    return [] if collection.blank?

    {
      pagination: {
        current_page: collection.current_page,
        next_page: collection.next_page,
        prev_page: collection.prev_page,
        total_pages: collection.total_pages,
        total_count: collection.total_count
      }
    }.merge(extra_meta)
  end
end