module Api
  module V1
    class GroupClassificationsController < AuthenticatedController

      def index
        group_classifications = GroupClassification.all
        render json: group_classifications
      end

      def show
        group_classification = GroupClassification.find_by(id: params[:id])
        render json: group_classification
      end

      def update
        group_classification = GroupClassification.find(params[:id])
        group_classification.update_attributes(group_classification_params)
        render json: group_classification
      end

      def destroy
        group_classification = GroupClassification.find(params[:id])
        group_classification.destroy
        render json: group_classification
      end

      private

      def group_classification_params
        params.fetch(:group_classification, params).permit(:name)
      end

    end
  end
end
