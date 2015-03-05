import DS from 'ember-data';

export default DS.Model.extend({
  vlanType:            DS.attr('string'),
  acceptableFrameType: DS.attr('string'),
  defaultVlan:         DS.attr('string'),
  service:             DS.belongsTo('service', {async: true}),

  serviceFragmentVlans: function() {
    var vlans = [];

    var services = this.get('service.serviceFragment.services');
    services.forEach( function(service) {
      vlans.push(service.get('vlan'));
    });

    return vlans.join(", ");
  }.property('service')
});
