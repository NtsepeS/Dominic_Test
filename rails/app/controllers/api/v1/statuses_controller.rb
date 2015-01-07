module Api
  module V1
    class StatusesController < AuthenticatedController

      def history
        @versions = PaperTrail::Version.order('created_at DESC')
        puts @versions
        binding.pry
        version_history = @versions.map do |v|
          {
            item_type: v.item_type,
            id:        v.id,
            event:     v.event,
            person:    v.whodunnit,
            date:      changeset_date(v.changeset),
            changes:   serialize_changes(v.changeset)
          }
        end

        render json: {statuses: version_history}
      end

      private

      def serialize_changes(changeset)
        changeset.map do |changes|
          {
            field_name: changes[0],
            from:       changes[1][0],
            to:         changes[1][1],
          }
        end
      end

      def changeset_date changeset
        if changeset.has_key? 'updated_at'
          changeset['updated_at'][0]
        elsif changeset.has_key? 'created_at'
          changeset['created_at'][0]
        else
          ''
        end
      end

      # def changeset_user (who)
      #   who ? User.find(who).name : 'System User'
      # end
    end
  end
end