import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  status: DS.belongsTo('status', { async: true }),
  baseStationSector: DS.hasMany('base-station-sector', { async: true }),
  coreNode: DS.belongsTo('core-node', { async: true })
});
