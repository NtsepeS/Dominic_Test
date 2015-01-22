# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Antenna.where(size: "30cm", serial_number: 1234, is_asset_tag: 5678, latitude: "-26.150553", longitude: "28.202592").first_or_create
Antenna.where(size: "30cm", serial_number: 110720023, is_asset_tag: 116034, latitude: "-26.042568", longitude: "28.018240").first_or_create
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

CoreNode.where(name: "Afgri Isando", status_id: 1, city_id: 1, latitude: "-26.147333", longitude: "28.206883").first_or_create
CoreNode.where(name: "Bryanston Towers", status_id: 1, city_id: 1, latitude: "-26.043517", longitude: "28.023899").first_or_create
BaseStationUnit.where(name: "w-isando-bsu1", status_id: 1, core_node_id: 1).first_or_create
BaseStationUnit.where(name: "w-bry-bsu1", status_id: 1, core_node_id: 2).first_or_create
BaseStationSector.where(name: "w-isando-bsu1 Sector 1", status_id: 1, base_station_unit_id: 1, sector: 1).first_or_create
BaseStationSector.where(name: "w-isando-bsu1 Sector 2", status_id: 1, base_station_unit_id: 1, sector: 2).first_or_create
BaseStationSector.where(name: "w-bry-bsu1 Sector 3", status_id: 1, base_station_unit_id: 2, sector: 3).first_or_create
BaseStationSector.where(name: "w-bry-bsu1 Sector 4", status_id: 1, base_station_unit_id: 2, sector: 4).first_or_create
ClientLink.where(name: "Afgri Isando (4): Bridgestone - Isando", branch: "Isando", circuit_number: "1-19BL0L4-W-ISANDO-BSU1", msad_number: "4.22", activation_date: "2014-09-29", mac_address: "00:05:59:4C:36:9E", distance: "555", client_id: 1, status_id: 4, network_operator_id: 1, link_type_id: 1, base_station_sector_id: 1, antenna_id: 1, solution_identifier: "1-19BL0L4", billing_account: "Bridgestone", service_account: "Bridgestone", service_account_site: "ORA-4082_BRI004").first_or_create
ClientLink.where(name: "Bryanston Towers (4): Adcorp - Bryanston", branch: "Bryanston", circuit_number: "1-NFO7FJ-W-BRY-BSU1", msad_number: "4.3", activation_date: "2012-02-24", mac_address: "00:05:59:4C:28:52", distance: "642", client_id: 2, status_id: 1, network_operator_id: 1, link_type_id: 1, base_station_sector_id: 3, antenna_id: 2, solution_identifier: "1-NFO7FJ", billing_account: "DIMENSION DATA (PTY) LTD - ADCORP", service_account: "DIMENSION DATA (PTY) LTD - ADCORP - BRYANSTON", service_account_site: "BRYANSTON").first_or_create


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
         latitude: get_text(node, 'location_gps_latitude'),
         longitude: get_text(node, 'location_gps_longitude'),
         city: city,
         status: Status.where(name: get_text(node, 'node_status')).first
  ).first_or_create

  core_node.save
end

# So now we drench by cut n paste

puts 'Base Station Units'
# Base Station Units
xml = File.open('db/initial_data/Wi-BandBaseStation.xml')
doc = Nokogiri::XML(xml.read())

doc.css('Item').each do |node|

  BaseStationUnit.where(
         name: get_text(node, 'Title'),
         status: Status.where(name: get_text(node, 'status')).first,
         core_node: CoreNode.where(name: get_text(node, 'core_node')).first,
  ).first_or_create

end

puts 'Sectors'

# Sectors
xml = File.open('db/initial_data/Wi-BandSectors.xml')
doc = Nokogiri::XML(xml.read())

doc.css('Item').each do |node|

  BaseStationSector.where(
         name: get_text(node, 'Title'),
         status: Status.where(name: get_text(node, 'status')).first,
         base_station_unit: BaseStationUnit.where(name: get_text(node, 'status')).first,
         sector: get_text(node, 'sector'),
  ).first_or_create

end

puts 'Client Links'

# Client Links
xml = File.open('db/initial_data/WiBandClientLinks.xml')
doc = Nokogiri::XML(xml.read())

doc.css('Item').each do |node|

  # Prolly
  client    = Client.where(name: get_text(node, 'client')).first_or_create
  netop     = NetworkOperator.where(name: get_text(node, 'network_operator')).first_or_create

  ClientLink.where(
         name: get_text(node, 'Title'),
         branch: get_text(node, 'branch'),
         circuit_number: get_text(node, 'circuit_number'),
         msad_number: get_text(node, 'msad_number'),
         activation_date: get_text(node, 'activation_date'), # @@@ Split off the time
         mac_address: get_text(node, 'mac_address'),
         distance: get_text(node, 'distance'),
         service_account: get_text(node, 'siebel_service_account'),
         client: client,
         status: Status.where(name: get_text(node, 'status')).first, # @@@ Fix statuses in source data
         network_operator: netop,
         link_type: LinkType.where(name: get_text(node, 'link_type')).first, # @@@ Check for missing link types
         base_station_sector: BaseStationSector.where(name: get_text(node, 'sector_name')).first_or_create,
         antenna: Antenna.where(
                                size: get_text(node, 'antenna_size'),
                                serial_number: get_text(node, 'antenna_sn'),
                                is_asset_tag: get_text(node, 'antenna_asset_tag'),
                                latitude: get_text(node, 'latitude'), # @@@ ??
                                longitude: get_text(node, 'longitude'), # @@@ ??
                  ).first_or_create, 
         solution_identifier: get_text(node, 'solution_id'),
         billing_account: get_text(node, 'siebel_billing_account'),
         service_account: get_text(node, 'siebel_service_account'),
         service_account_site: get_text(node, 'siebel_service_account_site'),
  ).first_or_create

end

