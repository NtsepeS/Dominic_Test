module Api
  module V1
    class StatusesController < AuthenticatedController

      include History

    end
  end
end