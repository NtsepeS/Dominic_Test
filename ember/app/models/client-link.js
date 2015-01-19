import DS from 'ember-data';

var ClientLink = DS.Model.extend({
  name:                 DS.attr('string'),
  branch:               DS.attr('string'),
  circuit_number:       DS.attr('string'),
  MSAD_number:          DS.attr('string'),
  activation_date:      DS.attr('date'),
  MAC_address:          DS.attr('string'),
  distance:             DS.attr('string'),
  solution_identifier:  DS.attr('string'),
  billing_account:      DS.attr('string'),
  service_account:      DS.attr('string'),
  service_account_site: DS.attr('string'),
  link_type:            DS.belongsTo('link-type')
});

export default ClientLink;