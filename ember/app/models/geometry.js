import DS from 'ember-data';

export default DS.Model.extend({
  latitude: DS.attr('number'),
  longitude: DS.attr('number'),
  altitude: DS.attr('number'),
  location:  DS.belongsTo('location', {async: true})
});
