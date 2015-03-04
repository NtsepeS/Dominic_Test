# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Antenna.where(size: "30cm", item_code: 'abc', location_id: 1).first_or_create
Antenna.where(size: "30cm",  item_code: 'def', location_id: 2).first_or_create
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

CoreNode.where(name: "Afgri Isando", status_id: 1, city_id: 1, location_id: 2).first_or_create
CoreNode.where(name: "Bryanston Towers", status_id: 1, city_id: 1, location_id: 2).first_or_create
BaseStationUnit.where(name: "w-isando-bsu1", status_id: 1, core_node_id: 1).first_or_create
BaseStationUnit.where(name: "w-bry-bsu1", status_id: 1, core_node_id: 2).first_or_create
BaseStationSector.where(name: "w-isando-bsu1 Sector 1", status_id: 1, base_station_unit_id: 1, sector: 1).first_or_create
BaseStationSector.where(name: "w-isando-bsu1 Sector 2", status_id: 1, base_station_unit_id: 1, sector: 2).first_or_create
BaseStationSector.where(name: "w-bry-bsu1 Sector 3", status_id: 1, base_station_unit_id: 2, sector: 3).first_or_create
BaseStationSector.where(name: "w-bry-bsu1 Sector 4", status_id: 1, base_station_unit_id: 2, sector: 4).first_or_create
ClientLink.where(name: "Afgri Isando (4): Bridgestone - Isando", branch: "Isando", circuit_number: "1-19BL0L4-W-ISANDO-BSU1", msad_number: "4.22", activation_date: "2014-09-29", mac_address: "00:05:59:4C:36:9E", distance: "555", client_id: 1, status_id: 4, network_operator_id: 1, link_type_id: 1, base_station_sector_id: 1, antenna_id: 1, solution_identifier: "1-19BL0L4", billing_account: "Bridgestone", service_account: "Bridgestone", service_account_site: "ORA-4082_BRI004").first_or_create
ClientLink.where(name: "Bryanston Towers (4): Adcorp - Bryanston", branch: "Bryanston", circuit_number: "1-NFO7FJ-W-BRY-BSU1", msad_number: "4.3", activation_date: "2012-02-24", mac_address: "00:05:59:4C:28:52", distance: "642", client_id: 2, status_id: 1, network_operator_id: 1, link_type_id: 1, base_station_sector_id: 3, antenna_id: 2, solution_identifier: "1-NFO7FJ", billing_account: "DIMENSION DATA (PTY) LTD - ADCORP", service_account: "DIMENSION DATA (PTY) LTD - ADCORP - BRYANSTON", service_account_site: "BRYANSTON").first_or_create

Geometry.where(latitude: "800.01", longitude: "900.1", altitude: "1.0").first_or_create
Geometry.where(latitude: "600.02", longitude: "700.2", altitude: "2.0").first_or_create
Vicinity.where(physical_address: "22 Made up street, Sandton, Gauteng, South Africa").first_or_create
Vicinity.where(physical_address: "P Sherman 42 Wallaby Way, Sydney, Australia").first_or_create

Location.where(geometry_id: 1, vicinity_id: 1).first_or_create
Location.where(geometry_id: 2, vicinity_id: 2).first_or_create

GroupClassification.where(name: 'Outdoor').first_or_create
SubGroupClassification.where(name: 'LOS', group_classification_id: 1).first_or_create
SubGroupClassification.where(name: 'Antenna Mount', group_classification_id: 1).first_or_create
SubGroupClassification.where(name: 'Outdoor Cable', group_classification_id: 1).first_or_create
GroupClassification.where(name: 'Indoor').first_or_create
SubGroupClassification.where(name: 'MSAD', group_classification_id: 2).first_or_create
SubGroupClassification.where(name: 'Equipment Room', group_classification_id: 2).first_or_create
SubGroupClassification.where(name: 'Indoor Cable', group_classification_id: 2).first_or_create
Album.where(id: 1).first_or_create
Album.where(id: 2).first_or_create
Picture.where(mechanism: 'url', picture_data: 'www.test.com/pic_1.jpg', date_taken: '2015-01-29 12:00:00', album_id: 1).first_or_create
Picture.where(mechanism: 'url', picture_data: 'www.test.com/pic_2.jpg', date_taken: '2015-01-29 12:01:00', album_id: 1).first_or_create
Picture.where(mechanism: 'url', picture_data: 'www.test.com/pic_3.jpg', date_taken: '2015-01-29 12:00:00', album_id: 1).first_or_create
Picture.where(mechanism: 'file', picture_data: '/data/public/pic_4.jpg', date_taken: '2015-01-29 12:01:00', album_id: 2).first_or_create
Picture.where(mechanism: 'file', picture_data: '/data/public/pic_5.jpg', date_taken: '2015-01-29 12:01:00', album_id: 2).first_or_create
Picture.where(mechanism: 'url', picture_data: 'www.test.com/pic_6.jpg', date_taken: '2015-01-29 12:00:00', album_id: 2).first_or_create
SubGroupPictureSet.where(album_id: 1, sub_group_classification_id: 1, client_link_id: 1).first_or_create
SubGroupPictureSet.where(album_id: 2, sub_group_classification_id: 2, client_link_id: 1).first_or_create

RfPerformanceParameter.where(uplink_rssi: "Some RSSI", downlink_rssi: "Some RSSI").first_or_create
AntennaParameter.where(polarization: "polarization").first_or_create
Modulation.where(uplink_max: 5).first_or_create
OperatingParameter.where(location_id: 1, parameterized: RfPerformanceParameter.find(1)).first_or_create
OperatingParameter.where(location_id: 1, parameterized: AntennaParameter.find(1)).first_or_create
OperatingParameter.where(location_id: 1, parameterized: Modulation.find(1)).first_or_create

# Service Fragment Test
ServiceFragment.where(work_order_number: "123", line_speed: 14, service_type: "Voice (rtPS)",  physical_mode: "4QAM" ,client_link_id: 1).first_or_create
ServiceFragment.where(work_order_number: "234", line_speed: 2, service_type: "Voice (rtPS)",  physical_mode: "4QAM" ,client_link_id: 1).first_or_create


Service.where(linetag: "linetag-1", line_speed: 1, vlan: "143", service_fragment_id: 1).first_or_create
Service.where(linetag: "linetag-2", line_speed: 1.5, vlan: "263", service_fragment_id: 1).first_or_create
Service.where(linetag: "linetag-3", line_speed: 2, vlan: "336", service_fragment_id: 1).first_or_create
Service.where(linetag: "linetag-4", line_speed: 10, vlan: "122", service_fragment_id: 1).first_or_create

Service.where(linetag: "linetag-5", line_speed: 1, vlan: "143", service_fragment_id: 2).first_or_create
Service.where(linetag: "linetag-6", line_speed: 2, vlan: "143", service_fragment_id: 2).first_or_create
















