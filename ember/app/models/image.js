import DS from 'ember-data';

export default DS.Model.extend({
  url:        DS.attr('string'),
  clientLink: DS.belongsTo('client-link', {async: true})
});
