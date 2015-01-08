module History
  extend ActiveSupport::Concern

    def history
      print "jhfdvhgsfcagfs"
      puts params[:id]
      status = Status.find(params[:id])

      version_history = papertrail_for(status)

      render json:  version_history
    end

    private

    def papertrail_for( model )
      # versions = PaperTrail::Version.order('created_at DESC')
      model.versions.map do |v|
        {
          item_type: v.item_type,
          id:        v.id,
          event:     v.event,
          person:    v.whodunnit,
          date:      changeset_date(v.changeset),
          changes:   serialize_changes(v.changeset)
        }
      end
    end

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

end