module History
  extend ActiveSupport::Concern

  def papertrail_for( model )
    model.versions.map do |v|
      {
        item_type: v.item_type,
        id:        v.id,
        event:     v.event,
        person:    v.whodunnit,
        date:      v.created_at,
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
end
