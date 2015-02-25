import DS from 'ember-data';

var Pictures = DS.Model.extend({
  mechanism: DS.attr('string'),
  url:       DS.attr('string'),
  dateTaken: DS.attr('date'),
  album:     DS.belongsTo('album', {async: true})
});

export default Pictures;
