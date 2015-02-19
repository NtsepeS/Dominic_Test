import DS from 'ember-data';

export default DS.Model.extend({
  OperatingParameters: DS.hasMany('operating-parameter')
});
