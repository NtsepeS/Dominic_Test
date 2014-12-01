module Api
  module V1
    class UserInfoController < AuthenticatedController
      def user
        render status: :ok, json: UserPresenter.new(current_user).as_json
      end
    end
  end
end