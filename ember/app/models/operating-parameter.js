import DS from 'ember-data';

export default DS.Model.extend({
  location:   DS.belongsTo('location', {async: true}),
  paramTypes: DS.hasMany('param-type', {polymorphic: true, async: true})
});
