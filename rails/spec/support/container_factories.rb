# Simple helper methods to take the pain out of creating container
# hierarchies
module ContainerFactories

  def create_client_link( factory_name, parent = nil )
    parent ||= create_base_station_sector( :base_station_sector )
    containable = FactoryGirl.build( factory_name )
    create_containable( containable, parent )
  end

  def create_base_station_sector( factory_name, parent = nil )
    parent ||= create_base_station_unit( :base_station_unit )
    containable = FactoryGirl.build( factory_name )
    create_containable( containable, parent )
  end

  def create_base_station_unit( factory_name, parent = nil )
    parent ||= create_core_node( :core_node )
    containable = FactoryGirl.build( factory_name )
    create_containable( containable, parent )
  end

  def create_core_node( factory_name )
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
