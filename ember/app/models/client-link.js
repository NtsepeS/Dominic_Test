import DS from 'ember-data';

var ClientLink = DS.Model.extend({
  name:                DS.attr('string'),
  branch:              DS.attr('string'),
  circuitNumber:       DS.attr('string'),
  msadNumber:          DS.attr('string'),
  activationDate:      DS.attr('date'),
  macAddress:          DS.attr('string'),
  distance:            DS.attr('string'),
  solutionIdentifier:  DS.attr('string'),
  billingAccount:      DS.attr('string'),
  serviceAccount:      DS.attr('string'),
  serviceAccountSite:  DS.attr('string'),
  linkType:            DS.belongsTo('link-type', {async: true}),
  antenna:             DS.belongsTo('antenna', {async: true}),
  networkOperator:     DS.belongsTo('network-operator', {async: true}),
  baseStationSector:   DS.belongsTo('base-station-sector', {async: true}),
  client:              DS.belongsTo('client', {async: true}),
  status:              DS.belongsTo('status', {async: true}),
  subGroupPictureSets: DS.hasMany('sub-group-picture-set', {async: true}),
  serviceFragments:    DS.hasMany('service-fragment', {async: true})
});

export default ClientLink;
