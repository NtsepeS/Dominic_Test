import DS from 'ember-data';

var ClientLink = DS.Model.extend({
  name:           DS.attr('string'),
  branch:         DS.attr('string'),
  circuit_number: DS.attr('string'),
  msad_number:    DS.attr('string')
});

ClientLink.reopenClass({
  FIXTURES:[
    {
      id:             1,
      name:           'ABC',
      branch:         'Johannesburg',
      circuit_number: '12323-7463',
      msad_number:    '5346513'
    },
    {
      id:             2,
      name:           'DEF',
      branch:         'CPT',
      circuit_number: '13-3',
      msad_number:    '13'
    },
  ]
});

export default ClientLink;