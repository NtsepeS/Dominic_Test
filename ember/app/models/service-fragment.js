import DS from 'ember-data';

export default DS.Model.extend({
  services: DS.hasMany('service', {async: true}),
  clientLink: DS.belongsTo('client-link', { async: true })
});
