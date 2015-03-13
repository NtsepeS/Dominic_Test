import DS from 'ember-data';

export default DS.Model.extend({
  linetag:         DS.attr('string'),
  lineSpeed:       DS.attr('number'),
  vlan:            DS.attr('string'),
  serviceFragment: DS.belongsTo('service-fragment', { async: true }),
  ports:           DS.hasMany('port', {async: true})
});
