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
Status.where(name: "Commissioning").first_or_create
Status.where(name: "Under Construction").first_or_create
Status.where(name: "To Be Decommissioned").first_or_create
Status.where(name: "Waiting for Field Service Engineer Report").first_or_create
Status.where(name: "Waiting for Field Services QA Approval").first_or_create
Status.where(name: "Waiting for IS QA Approval").first_or_create

# CoreNode.where(name: "Afgri Isando", status_id: 1, city_id: 1, location_id: 2).first_or_create
# CoreNode.where(name: "Bryanston Towers", status_id: 1, city_id: 1, location_id: 2).first_or_create
# BaseStationUnit.where(name: "w-isando-bsu1", status_id: 1, core_node_id: 1).first_or_create
# BaseStationUnit.where(name: "w-bry-bsu1", status_id: 1, core_node_id: 2).first_or_create
# BaseStationSector.where(name: "w-isando-bsu1 Sector 1", status_id: 1, base_station_unit_id: 1, sector: 1).first_or_create
# BaseStationSector.where(name: "w-isando-bsu1 Sector 2", status_id: 1, base_station_unit_id: 1, sector: 2).first_or_create
# BaseStationSector.where(name: "w-bry-bsu1 Sector 3", status_id: 1, base_station_unit_id: 2, sector: 3).first_or_create
# BaseStationSector.where(name: "w-bry-bsu1 Sector 4", status_id: 1, base_station_unit_id: 2, sector: 4).first_or_create
ClientLink.where(name: "Upington", branch: "Isando", circuit_number: "1-19BL0L4-W-ISANDO-BSU1", msad_number: "4.22", activation_date: "2014-09-29", mac_address: "00:05:59:4C:36:9E", distance: "555", client_id: 1, status_id: 4, network_operator_id: 1, link_type_id: 1, base_station_sector_id: 1, antenna_id: 1, solution_identifier: "1-19BL0L4", billing_account: "Bridgestone", service_account: "Bridgestone", service_account_site: "ORA-4082_BRI004").first_or_create
ClientLink.where(name: "Britstown", branch: "Bryanston", circuit_number: "1-NFO7FJ-W-BRY-BSU1", msad_number: "4.3", activation_date: "2012-02-24", mac_address: "00:05:59:4C:28:52", distance: "642", client_id: 2, status_id: 1, network_operator_id: 1, link_type_id: 1, base_station_sector_id: 3, antenna_id: 2, solution_identifier: "1-NFO7FJ", billing_account: "DIMENSION DATA (PTY) LTD - ADCORP", service_account: "DIMENSION DATA (PTY) LTD - ADCORP - BRYANSTON", service_account_site: "BRYANSTON").first_or_create

Geometry.where(latitude: "-28.435476", longitude: "21.208517", altitude: "1.0").first_or_create
Geometry.where(latitude: "-30.380982", longitude: "22.4278566", altitude: "2.0").first_or_create
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

RfPerformanceParameter.where(uplink_rssi: 3.46, downlink_rssi: 3.45, uplink_cnr: 3.43, downlink_cnr: 2.34, tx_power: 2.54, step_attenuator: 5.5, radio_id:1).first_or_create
RfPerformanceParameter.where(uplink_rssi: 2.46, downlink_rssi: 3.45, uplink_cnr: 1.43, downlink_cnr: 1.44, tx_power: 1.53, step_attenuator: 5.5, radio_id:2).first_or_create
RfPerformanceParameter.where(uplink_rssi: 1.46, downlink_rssi: 3.45, uplink_cnr: 0.43, downlink_cnr: 2.54, tx_power: 3.44, step_attenuator: 5.5, radio_id:1).first_or_create
RfPerformanceParameter.where(uplink_rssi: 5.46, downlink_rssi: 3.45, uplink_cnr: 2, downlink_cnr: 2.34, tx_power: 2.54, step_attenuator: 5.5, radio_id:1).first_or_create

AntennaParameter.where(polarization: "polarization").first_or_create
Modulation.where(uplink_max: "4 QAM", uplink_min: "64 QAM", downlink_min: "4 QAM 2/3", downlink_max: "16 QAM", radio_id: 1).first_or_create
Modulation.where(uplink_max: "4 QAM 2/3", uplink_min: "4 QAM", downlink_min: "16 QAM", downlink_max: "4 QAM 2/3", radio_id: 1).first_or_create
Modulation.where(uplink_max: "4 QAM 2/3", uplink_min: "64 QAM", downlink_min: "4 QAM", downlink_max: "4 QAM", radio_id: 2).first_or_create
OperatingParameter.where(location_id: 1, parameterized: RfPerformanceParameter.find(1)).first_or_create
OperatingParameter.where(location_id: 1, parameterized: AntennaParameter.find(1)).first_or_create
OperatingParameter.where(location_id: 1, parameterized: Modulation.find(1)).first_or_create


Geometry.where(latitude: "-26.7217916", longitude: "27.8487259", altitude: "1").first_or_create
Geometry.where(latitude: "-25.7586499", longitude: "28.219682", altitude: "2.0").first_or_create
Geometry.where(latitude: "-26.2145598", longitude: "27.964365", altitude: "2.0").first_or_create
Geometry.where(latitude: "-33.9149861", longitude: "18.6560594", altitude: "2.0").first_or_create
Geometry.where(latitude: "-29.8483794", longitude: "30.9924624", altitude: "2.0").first_or_create
Geometry.where(latitude: "-28.7238759", longitude: "24.7232065", altitude: "2.0").first_or_create

Location.where(geometry_id: 3).first_or_create
Location.where(geometry_id: 4).first_or_create
Location.where(geometry_id: 5).first_or_create
Location.where(geometry_id: 6).first_or_create
Location.where(geometry_id: 7).first_or_create
Location.where(geometry_id: 8).first_or_create

Antenna.where(size: "30cm", item_code: 'abc', location_id: 3).first_or_create # Id = 3
Antenna.where(size: "30cm",  item_code: 'def', location_id: 4).first_or_create
Antenna.where(size: "30cm", item_code: 'abc', location_id: 5).first_or_create
Antenna.where(size: "30cm",  item_code: 'def', location_id: 6).first_or_create
Antenna.where(size: "30cm", item_code: 'abc', location_id: 7).first_or_create
Antenna.where(size: "30cm",  item_code: 'def', location_id: 8).first_or_create

CoreNode.where(name: 'Pretoria', location_id: 4, status_id: 1).first_or_create
CoreNode.where(name: 'Johannesburg', location_id: 5, status_id: 6).first_or_create
CoreNode.where(name: 'Vanderbijlpark', location_id: 3, status_id: 4).first_or_create

BaseStationUnit.where(name: "base-station 1", status_id: 1, core_node_id: 1).first_or_create
BaseStationUnit.where(name: "base-station 2", status_id: 1, core_node_id: 2).first_or_create
BaseStationUnit.where(name: "base-station 3", status_id: 1, core_node_id: 3).first_or_create

BaseStationSector.where(name: "Sector 1", status_id: 1, base_station_unit_id: 1, sector: 1).first_or_create
BaseStationSector.where(name: "Sector 2", status_id: 1, base_station_unit_id: 2, sector: 2).first_or_create
BaseStationSector.where(name: "Sector 3", status_id: 1, base_station_unit_id: 3, sector: 3).first_or_create

ClientLink.where(name: "Capetwm", antenna_id: 6, base_station_sector_id: 1, status_id: 1).first_or_create
ClientLink.where(name: "Durban", antenna_id: 7, base_station_sector_id: 2, status_id: 1).first_or_create
ClientLink.where(name: "Kimberly", antenna_id: 8, base_station_sector_id: 3, status_id: 5).first_or_create

# Service Fragment Test
ServiceFragment.where(work_order_number: "123", line_speed: 14, service_type: "Voice (rtPS)",  physical_mode: "4QAM" ,client_link_id: 1).first_or_create
ServiceFragment.where(work_order_number: "234", line_speed: 2, service_type: "Voice (rtPS)",  physical_mode: "4QAM" ,client_link_id: 1).first_or_create


Service.where(linetag: "linetag-1", line_speed: 1, vlan: "[143, 234]", service_fragment_id: 1).first_or_create
Service.where(linetag: "linetag-2", line_speed: 1.5, vlan: "[263]", service_fragment_id: 1).first_or_create
Service.where(linetag: "linetag-3", line_speed: 2, vlan: "[336]", service_fragment_id: 1).first_or_create
Service.where(linetag: "linetag-4", line_speed: 10, vlan: "[122]", service_fragment_id: 1).first_or_create

Service.where(linetag: "linetag-5", line_speed: 1, vlan: "[143]", service_fragment_id: 2).first_or_create
Service.where(linetag: "linetag-6", line_speed: 2, vlan: "[143]", service_fragment_id: 2).first_or_create

Port.where(vlan_type: 'Provider Port', acceptable_frame_type: 'Tagged Only', default_vlan: '143', service_id: 1).first_or_create
Port.where(vlan_type: 'VLAN Transparent', acceptable_frame_type: 'Tagged Only', default_vlan: '143', service_id: 1).first_or_create
Port.where(vlan_type: 'Provider Port', acceptable_frame_type: 'Tagged Only', default_vlan: '143', service_id: 1).first_or_create
Port.where(vlan_type: 'Provider Port', acceptable_frame_type: 'Tagged Only', default_vlan: '143', service_id: 2).first_or_create
Port.where(vlan_type: 'Provider Port', acceptable_frame_type: 'Tagged Only', default_vlan: '143', service_id: 3).first_or_create

Radio.where(name: 'abcd', item_code: '1234', icasa_sticker: true).first_or_create
Radio.where(name: 'aden', item_code: '12345', icasa_sticker: false).first_or_create

BaseStationSector.where(name: "Sector 3", status_id: 1,sector: 3, base_station_unit:
  BaseStationUnit.where(name: "base-station 1", status_id: 1,
    core_node: CoreNode.where(name: 'Pretoria', status_id: 1,
      location: Location.where(
        geometry: Geometry.where(latitude: "-29.7369478", longitude: "31.0211299", altitude: "1").first_or_create
      ).first_or_create
    ).first_or_create
  ).first_or_create
).first_or_create

ClientLink.where(name: 'Garsfontein (4): Dimension Data - Santam - Kasteelpark', msad_number: "16.4", solution_identifier: "QW648-RT92", status_id: 1, base_station_sector_id: 1, radio_id: 1,
  antenna: Antenna.where(size: "30cm", item_code: 'abc',
    location: Location.where(
      geometry:
        Geometry.where(latitude: "-25.78967", longitude: "28.27864", altitude: "1").first_or_create
      ).first_or_create
    ).first_or_create
  ).first_or_create


ClientLink.where(name: 'BMW', msad_number: "16.4", solution_identifier: "QW648-RT92", status_id: 2, base_station_sector_id: 1, radio_id: 2,
  antenna: Antenna.where(size: "30cm", item_code: 'abc',
    location: Location.where(
      geometry:
        Geometry.where(latitude: "-25.981970", longitude: "28.130860", altitude: "1").first_or_create
      ).first_or_create
    ).first_or_create
  ).first_or_create

ClientLink.where(name: 'Bayport', msad_number: "16.4", solution_identifier: "QW648-RT92", status_id: 3, base_station_sector_id: 1,
  antenna: Antenna.where(size: "30cm", item_code: 'abc',
    location: Location.where(
      geometry:
        Geometry.where(latitude: "-26.054806", longitude: "28.060833", altitude: "1").first_or_create
      ).first_or_create
    ).first_or_create
  ).first_or_create

ClientLink.where(name: 'BMW', msad_number: "16.4", solution_identifier: "QW648-RT92", status_id: 1, base_station_sector_id: 1,
  antenna: Antenna.where(size: "30cm", item_code: 'abc',
    location: Location.where(
      geometry:
        Geometry.where(latitude: "-23.912790", longitude: "29.444181", altitude: "1").first_or_create
      ).first_or_create
    ).first_or_create
  ).first_or_create

ClientLink.where(name: 'Blue Label Distribution', msad_number: "16.4", solution_identifier: "QW648-RT92", status_id: 5, base_station_sector_id: 1,
  antenna: Antenna.where(size: "30cm", item_code: 'abc',
    location: Location.where(
      geometry:
        Geometry.where(latitude: "-26.100028", longitude: "28.051056", altitude: "1").first_or_create
      ).first_or_create
    ).first_or_create
  ).first_or_create

# ########################################################################

ClientLink.where(name: 'Blue Label Distribution 1', msad_number: "16.4", solution_identifier: "QW648-RT92", status_id: 6, base_station_sector_id: 4,
  antenna: Antenna.where(size: "30cm", item_code: 'abc',
    location: Location.where(
      geometry:
        Geometry.where(latitude: "29.7337613", longitude: "30.965405", altitude: "1").first_or_create
      ).first_or_create
    ).first_or_create
  ).first_or_create

ClientLink.where(name: 'Blue Label Distribution 2', msad_number: "16.4", solution_identifier: "QW648-RT92", status_id: 7, base_station_sector_id: 4,
  antenna: Antenna.where(size: "30cm", item_code: 'abc',
    location: Location.where(
      geometry:
        Geometry.where(latitude: "-29.7751875", longitude: "30.9393704", altitude: "1").first_or_create
      ).first_or_create
    ).first_or_create
  ).first_or_create

ClientLink.where(name: 'Blue Label Distribution 3', msad_number: "16.4", solution_identifier: "QW648-RT92", status_id: 8, base_station_sector_id: 4,
  antenna: Antenna.where(size: "30cm", item_code: 'abc',
    location: Location.where(
      geometry:
        Geometry.where(latitude: "-29.8511913", longitude: "30.9180025", altitude: "1").first_or_create
      ).first_or_create
    ).first_or_create
  ).first_or_create

ClientLink.where(name: 'Blue Label Distribution 4', msad_number: "16.4", solution_identifier: "QW648-RT92", status_id: 9, base_station_sector_id: 4,
  antenna: Antenna.where(size: "30cm", item_code: 'abc',
    location: Location.where(
      geometry:
        Geometry.where(latitude: "-29.9254006", longitude: "30.9031174", altitude: "1").first_or_create
      ).first_or_create
    ).first_or_create
  ).first_or_create

ClientLink.where(name: 'Blue Label Distribution 5', msad_number: "16.4", solution_identifier: "QW648-RT92", status_id: 10, base_station_sector_id: 4,
  antenna: Antenna.where(size: "30cm", item_code: 'abc',
    location: Location.where(
      geometry:
        Geometry.where(latitude: "-29.8964904", longitude: "31.0117711", altitude: "1").first_or_create
      ).first_or_create
    ).first_or_create
  ).first_or_create



