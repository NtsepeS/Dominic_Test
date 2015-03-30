# Simple helper methods to take the pain out of creating container
# hierarchies
module ContainerFactories

  def create_client_link( parent = nil )
    factory_name = :client_link
    parent ||= create_base_station_sector
    containable = FactoryGirl.build( factory_name )
    create_containable( containable, parent )
  end

  def create_base_station_sector( parent = nil )
    factory_name = :base_station_sector
    parent ||= create_base_station_unit
    containable = FactoryGirl.build( factory_name )
    create_containable( containable, parent )
  end

  def create_base_station_unit( parent = nil )
    factory_name = :base_station_unit
    parent ||= create_core_node
    containable = FactoryGirl.build( factory_name )
    create_containable( containable, parent )
  end

  def create_core_node
    factory_name = :core_node
    containable = FactoryGirl.build( factory_name )
    create_containable( containable )
  end

  def create_containable( containable, parent = nil )
    ncs = NewContainerService.new.create( containable, in: parent )
    raise ncs.errors unless ncs.successful?
    ncs.containable
  end

end

RSpec.configure do |config|
  config.include( ContainerFactories )
end
