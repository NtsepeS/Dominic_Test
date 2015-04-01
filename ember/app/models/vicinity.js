import DS from 'ember-data';

export default DS.Model.extend({
  physicalAddress: DS.attr('string'),
  location:        DS.belongsTo('location', {async: true})
});
