import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  clientLinks: DS.hasMany('client-link', {async: true})
});
