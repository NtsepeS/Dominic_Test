import DS from 'ember-data';

export default DS.Model.extend({
  name:            DS.attr('string'),
  status:          DS.belongsTo('status', { async: true }),
  sector:          DS.attr('number'),
  baseStationUnit: DS.belongsTo('base-station-unit', { async: true }),
  clientLinks:     DS.hasMany('client-link', { async: true }),
});
