import DS from 'ember-data';

export default DS.Model.extend({
  equipment: DS.hasMany('equipment', {async: true})
});
