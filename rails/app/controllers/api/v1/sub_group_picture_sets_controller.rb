module Api
  module V1
    class SubGroupPictureSetsController < AuthenticatedController

      def index
        sub_group_picture_sets = SubGroupPictureSet.all
        render json: sub_group_picture_sets
      end

      def show
        sub_group_picture_set = SubGroupPictureSet.find(params[:id])
        render json: sub_group_picture_set
      end

      def update
        sub_group_picture_set = SubGroupPictureSet.find(params[:id])
        sub_group_picture_set.update_attributes(sub_group_picture_set_params)
        render json: sub_group_picture_set
      end

      def destroy
        sub_group_picture_set = SubGroupPictureSet.find(params[:id])
        sub_group_picture_set.destroy
        render json: sub_group_picture_set
      end

      private

      def sub_group_picture_set_params
        params.fetch(:sub_group_picture_set, params).permit(:album_id, :sub_group_classification_id, :client_link_id)
      end

    end
  end
end
