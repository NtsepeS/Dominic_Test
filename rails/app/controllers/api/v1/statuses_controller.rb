module Api
  module V1
    class StatusesController < AuthenticatedController
      def history
        @versions = PaperTrail::Version.order('created_at DESC')

        version_history = []
        @versions.each do |v|
          hash = {
            item_type: v.item_type,
            id:        v.id,
            event:     v.event,
            person:    v.whodunnit,
            changes:   v.changeset
          }
          version_history.push(hash)
        end
        render json: version_history
      end
    end
  end
end