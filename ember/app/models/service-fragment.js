import DS from 'ember-data';

export default DS.Model.extend({
  workOrderNumber: DS.attr('string'),
  lineSpeed:       DS.attr('number'),
  physicalMode:    DS.attr('string'),
  serviceType:     DS.attr('string'),
  services:        DS.hasMany('service', {async: true}),
  clientLink:      DS.belongsTo('client-link', { async: true }),

  serviceLineSpeeds: Ember.computed.mapBy('services', 'lineSpeed'),
  totalLineSpeed:    Ember.computed.sum('serviceLineSpeeds')
});
