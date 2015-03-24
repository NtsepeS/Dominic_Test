module Api
  module V1
    class AuthorizationsController < AuthenticatedController

      def index
        authorizations = Authorization.all
        render json: authorizations
      end

      def show
        authorization = Authorization.find( params[:id] )
        render json: authorization
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
          render json: {errors: invite.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        authorization = Authorization.find( params[:id] )
        if authorization.destroy
          render json: authorization
        else
          render json: authorization.errors.to_json, status: :unprocessable_entity
        end
      end

      private

      def authorization_params
        params.require(:authorization).permit(:email, :name, :invited_by)
      end

    end
  end
end
