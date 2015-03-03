import DS from 'ember-data';

export default DS.Model.extend({
  name:          DS.attr('string'),
  isAssetTag:    DS.attr('string'),
  serialNumber:  DS.attr('string'),
  modelNumber:   DS.attr('string'),
  productNumber: DS.attr('string'),
  equipmentType: DS.belongsTo('equipment-type', {polymorphic: true, async: true})
});
