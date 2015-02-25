import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  city: DS.attr('string'),
  status: DS.belongsTo('status', { async: true }),
  baseStationUnit: DS.hasMany('base-station-unit', {async: true}),
  location: DS.belongsTo('location', {async: true})
});
