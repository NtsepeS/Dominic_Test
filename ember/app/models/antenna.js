import DS from 'ember-data';

export default DS.Model.extend({
  size:      DS.attr('string'),
  location:  DS.belongsTo('location', {async: true}),
  item_code: DS.attr('string'),
});
