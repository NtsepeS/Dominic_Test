import DS from 'ember-data';

export default DS.Model.extend({
  service: DS.belongsTo('service', {async: true})
});
