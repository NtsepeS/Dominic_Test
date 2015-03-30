module ParentContainerParams
  extend ActiveSupport::Concern

  # Attempts to infer and load parent associations in the following manner:
  #
  #   params[:client_link][:base_station_sector_id] = 1
  #   BaseStationSector.find( 1 )
  #
  # +name+ is the main params hash to look in for the "blessed" list
  # of +parents+.
  def parent_container( name, *parents )
    return unless params[ name ].present?

    type = Array(parents).detect { |key|
      params[ name ][ key ].present?
    }

    return if type.nil?

    parent_class = type.to_s.sub(/_id\z/, '').classify.safe_constantize
    if parent_class.present?
      id = params[ name ].delete( type )
      parent_class.find( id )
    end
  end
end
