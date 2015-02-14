import DS from 'ember-data';

export default DS.Model.extend({
  image_data:       DS.attr('string'),
  clientLink: DS.belongsTo('client-link', {async: true})
});
