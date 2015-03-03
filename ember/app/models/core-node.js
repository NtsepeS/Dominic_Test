import DS from 'ember-data';

export default DS.Model.extend({
  name:             DS.attr('string'),
  status:           DS.belongsTo('status', { async: true }),
  city:             DS.belongsTo('city', { async: true }),
  baseStationUnits: DS.hasMany('base-station-unit', {async: true}),
  location:         DS.belongsTo('location', {async: true})
});
