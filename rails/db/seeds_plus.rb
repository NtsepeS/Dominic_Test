# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.where(name: "Johannesburg").first_or_create
City.where(name: "Cape Town").first_or_create
City.where(name: "Durban").first_or_create
Client.where(name: "Bridgestone").first_or_create
Client.where(name: "Adcorp").first_or_create
LinkType.where(name: "Normal").first_or_create
LinkType.where(name: "Multi-Tenant").first_or_create
LinkType.where(name: "Layer 2 Wholesale").first_or_create
LinkType.where(name: "IS Internal (Staff Account)").first_or_create
NetworkOperator.where(name: "Internet Solutions").first_or_create
NetworkOperator.where(name: "Some Other Network Operator").first_or_create

Status.where(name: "Operational").first_or_create
Status.where(name: "Audit Done").first_or_create
Status.where(name: "Audit In Progress").first_or_create
Status.where(name: "Decommissioned").first_or_create
Status.where(name: "AUDIT IN PROCESS").first_or_create

require 'nokogiri'

def get_text(node, key)
  return node.css(key).inner_text
end

puts 'CoreNodes'
xml = File.open('db/initial_data/CoreNodes.xml')
doc = Nokogiri::XML(xml.read())

doc.css('Item').each do |node|

  # City is prolly not in the db yet
  city = City.where(name: get_text(node, 'city_name')).first_or_create

  core_node = CoreNode.where(
    name: get_text(node, 'Title'),
    # latitude: get_text(node, 'location_gps_latitude'),
    # longitude: get_text(node, 'location_gps_longitude'),
    city: city,
    status: Status.where(name: get_text(node, 'node_status')).first
  ).first_or_create

  NewContainerService.new.create( core_node )
end

# So now we drench by cut n paste

puts 'Base Station Units'

# Base Station Units
xml = File.open('db/initial_data/Wi-BandBaseStation.xml')
doc = Nokogiri::XML(xml.read())

doc.css('Item').each do |node|

  bsu = BaseStationUnit.where(
    name: get_text(node, 'Title'),
    status: Status.where(name: get_text(node, 'status')).first,
    # core_node: CoreNode.where(name: get_text(node, 'core_node')).first,
  ).first_or_create

  core_node = CoreNode.where(name: get_text(node, 'core_node')).first
  NewContainerService.new.create( bsu, in: core_node )
end

puts 'Sectors'

# Sectors
xml = File.open('db/initial_data/Wi-BandSectors.xml')
doc = Nokogiri::XML(xml.read())

doc.css('Item').each do |node|

  bss = BaseStationSector.where(
    name: get_text(node, 'Title'),
    status: Status.where(name: get_text(node, 'status')).first,
    sector: get_text(node, 'sector'),
  ).first_or_create

  base_station_unit = BaseStationUnit.where(name: get_text(node, 'base_station')).first
  NewContainerService.new.create( bss, in: base_station_unit )
end

puts 'Client Links'

# Client Links
xml = File.open('db/initial_data/WiBandClientLinks.xml')
doc = Nokogiri::XML(xml.read())

doc.css('Item').each do |node|

  # Prolly
  client    = Client.where(name: get_text(node, 'client')).first_or_create
  netop     = NetworkOperator.where(name: get_text(node, 'network_operator')).first_or_create

  cl = ClientLink.where(
    name: get_text(node, 'Title'),
    branch: get_text(node, 'branch'),
    circuit_number: get_text(node, 'circuit_number'),
    msad_number: get_text(node, 'msad_number'),
    # activation_date: get_text(node, 'activation_date'), # @@@ Split off the time
    mac_address: get_text(node, 'mac_address'),
    distance: get_text(node, 'distance'),
    client: client,
    status: Status.where(name: get_text(node, 'status')).first, # @@@ Fix statuses in source data
    network_operator: netop,
    link_type: LinkType.where(name: get_text(node, 'link_type')).first, # @@@ Check for missing link types
    solution_identifier: get_text(node, 'solution_id'),
    billing_account: get_text(node, 'siebel_billing_account'),
    service_account: get_text(node, 'siebel_service_account'),
    service_account_site: get_text(node, 'siebel_service_account_site'),
  ).first_or_create

  base_station_sector = BaseStationSector.where(name: get_text(node, 'sector_name')).first
  NewContainerService.new.create( cl, in: base_station_sector )

  geometry = Geometry.where(
    latitude: get_text(node, 'latitude').to_f,
    longitude: get_text(node, 'longitude').to_f,
    altitude: get_text(node, 'altitude').to_f,
  ).first_or_create

  location = Location.where(geometry: geometry).first_or_create

  Antenna.where(
    size: get_text(node, 'antenna_size'),
    serial_number: get_text(node, 'antenna_sn'),
    is_asset_tag: get_text(node, 'antenna_asset_tag'),
    location: location,
    client_link: cl
  ).first_or_create
end
