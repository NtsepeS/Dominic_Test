import DS from 'ember-data';

var ClientLink = DS.Model.extend({
  name:          DS.attr('string'),
  branch:        DS.attr('string'),
  circuit_number: DS.attr('string'),
  MSAD_number:    DS.attr('string')
});

export default ClientLink;