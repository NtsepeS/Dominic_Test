import DS from 'ember-data';

var ClientLink = DS.Model.extend({
  name:               DS.attr('string'),
  branch:             DS.attr('string'),
  circuitNumber:      DS.attr('string'),
  msadNumber:         DS.attr('string'),
  activationDate:     DS.attr('date'),
  macAddress:         DS.attr('string'),
  distance:           DS.attr('string'),
  solutionIdentifier: DS.attr('string'),
  billingAccount:     DS.attr('string'),
  serviceAccount:     DS.attr('string'),
  serviceAccountSite: DS.attr('string'),
  linkType:           DS.belongsTo('link-type')
});

export default ClientLink;