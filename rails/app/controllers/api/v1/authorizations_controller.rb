module Api
  module V1
    class AuthorizationsController < AuthenticatedController

      def index
        authorizations = Authorization.all
        render json: authorizations
      end

      def create
        # Send off request to isid for invite
        invite = InviteService.new
        invite.call(
          "user",
          authorization_params[:email],
          authorization_params[:name],
          current_user.name,
          request
        )

        if invite.successful?
          render json: invite.authorization, status: :created
        else
          render json: invite.errors.to_json, status: :unprocessable_entity
        end
      end

      private

      def authorization_params
        params.require(:authorization).permit(:email, :name, :invited_by)
      end

    end
  end
end
