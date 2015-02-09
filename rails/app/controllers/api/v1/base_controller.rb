module Api
  module V1
    class BaseController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :render_404
      rescue_from ActionController::UnpermittedParameters, with: :bad_request

      protected

      def render_404(exception)
        render json: { message: exception.message }, status: :not_found
      end

      def bad_request(exception)
        render json: { message: exception.message }, status: :bad_request
      end
    end
  end
end
