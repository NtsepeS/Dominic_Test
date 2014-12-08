module Api
  module V1
    class UserInfoController < AuthenticatedController
      def user
        render json: UserPresenter.new(current_user)
      end
    end
  end
end