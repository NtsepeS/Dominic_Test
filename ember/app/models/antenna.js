import DS from 'ember-data';

export default DS.Model.extend({
  size:         DS.attr('string'),
  serialNumber: DS.attr('string'),
  isAssetTag:   DS.attr('string'),
  location:     DS.belongsTo('location', {async: true})
});
