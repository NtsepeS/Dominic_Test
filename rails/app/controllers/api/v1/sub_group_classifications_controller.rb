module Api
  module V1
    class SubGroupClassificationsController < AuthenticatedController

      def index
        sub_group_classifications = SubGroupClassification.all
        render json: sub_group_classifications
      end

      def show
        sub_group_classification = SubGroupClassification.find(params[:id])
        render json: sub_group_classification
      end

      def update
        sub_group_classification = SubGroupClassification.find(params[:id])
        sub_group_classification.update_attributes(sub_group_classification_params)
        render json: sub_group_classification
      end

      def destroy
        sub_group_classification = SubGroupClassification.find(params[:id])
        sub_group_classification.destroy
        render json: sub_group_classification
      end

      private

      def sub_group_classification_params
        params.fetch(:sub_group_classification, params).permit(:name, :group_classification_id)
      end

    end
  end
end
