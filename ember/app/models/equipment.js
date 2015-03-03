import DS from 'ember-data';

export default DS.Model.extend({
  equipmentType: DS.belongsTo('equipment-type', {polymorphic: true, async: true})
});
