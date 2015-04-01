import DS from 'ember-data';

export default DS.Model.extend({
  operatingParameters: DS.hasMany('operating-parameter', {async: true})
});
