module Api
  module V1
    class AuthorizationsController < AuthenticatedController

      def index
        authorizations = Authorization.all
        render json: authorizations
      end

      def invite
        # Send off request to isid for invite
        authorization = Authorization.new(authorization_params)
        if authorization.save
          render json: authorization, status: :created
        else
          render json: authorization.errors.to_json, status: :unprocessable_entity
        end
      end

      def authorization_params
        params.require(:authorization).permit(:email)
      end

    end
  end
end
