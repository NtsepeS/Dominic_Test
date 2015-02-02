require 'pry'
module Api
  module V1
    class BaseController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :render_404

      protected

      def render_404(exception)
        #TODO: log exception message
        puts exception.message
        render status: :not_found, text: "not found"
      end
    end
  end
end
