import DS from 'ember-data';

var ClientLink = DS.Model.extend({
  name:   DS.attr('string'),
  branch: DS.attr('string')
});

ClientLink.reopenClass({
  FIXTURES:[
    {id: 1, name: 'ABC', branch: 'Johannesburg'},
    {id: 2, name: 'DEF', branch: 'CPT'},
  ]
});

export default ClientLink;