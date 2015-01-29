import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model: function() {
    return this.modelFor('client-link');
  },

  setupController: function(controller, model) {
    controller.set('content', model);
    controller.set('linkTypes', this.store.find('link-type'));
    controller.set('antennas', this.store.find('antenna'));
    controller.set('networkOperators', this.store.find('network-operator'));
    controller.set('baseStationSectors', this.store.find('base-station-sector'));
    controller.set('clients', this.store.find('client'));
    controller.set('statuses', this.store.find('status'));
    controller.set('sub-group-picture-sets', this.store.find('sub-group-picture-set'));
  }
});
