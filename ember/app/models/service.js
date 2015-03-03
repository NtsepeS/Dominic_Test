import DS from 'ember-data';

export default DS.Model.extend({
  serviceFragment: DS.belongsTo('service-fragment', { async: true }),
  ports:           DS.hasMany('port', {async: true})
});
