import Ember from 'ember';

export default Ember.ObjectController.extend({
  hasServices: false,
  hasPorts: false,

  updateServices: function() {
    console.log('UPDATE SERVICE *********************************************');
    var _this = this;
    _this.set('hasServices', false);
    this.get('model.serviceFragments').forEach(function(serviceFragment) {
      if (!Ember.isEmpty(serviceFragment.get('services'))) {
        _this.set('hasServices', true);
      }
    });
  }.observes('model.serviceFragments.@each.services'),

  updatePorts: function() {
    console.log('UPDATE PORTS *********************************************');
    var _this = this;
    _this.set('hasPorts', false);
    this.get('model.serviceFragments').forEach(function(serviceFragment) {
      serviceFragment.get('services').forEach(function(service) {
        if (!Ember.isEmpty(service.get('ports'))) {
          _this.set('hasPorts', true);
        }
      });
    });
  }.observes('allPorts.@each.ports'),




  _allServices: function() {
    console.log('********************************** All services changed!');
    var serviceFragments = this.get('model.serviceFragments'),
    allServices = [];

    serviceFragments.forEach(function(serviceFragment) {
      serviceFragment.get('services').forEach(function(service) {
        allServices.addObject(service);
      });
    });

    return allServices;
  }.property('model.serviceFragments.@each.services'),














  allPorts: function () {
    console.log('************************** All ports changed!');
    // @each is currently only supported one level deep :(
    // https://github.com/emberjs/ember.js/issues/541
    var serviceFragments = this.get('model.serviceFragments'),
    allPorts = [],

    each = Ember.$.each;

    each(serviceFragments, function(i, serviceFragment) {
      each(serviceFragment.services, function(j, service) {
        each(service.ports, function(k, port) {
          allPorts.addObject(port);
        });
      });
    });

    return allPorts;
  }.property('_allServices')
});
