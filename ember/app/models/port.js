import DS from 'ember-data';

export default DS.Model.extend({
  vlanType:            DS.attr('string'),
  acceptableFrameType: DS.attr('string'),
  defaultVlan:         DS.attr('string'),
  service:             DS.belongsTo('service', {async: true})
});
