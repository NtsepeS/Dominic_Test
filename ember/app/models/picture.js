import DS from 'ember-data';

var Pictures = DS.Model.extend({
  mechanism:    DS.attr('string'),
  picture_data: DS.attr('string'),
  date_taken:   DS.attr('date'),
  album:        DS.belongsTo('album', {async: true})
});

export default Pictures;
