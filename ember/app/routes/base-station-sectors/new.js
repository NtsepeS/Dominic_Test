import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  templateName:   'base-station-sector/edit',
  controllerName: 'base-station-sector/edit',

  model: function(){
    return this.store.createRecord('base-station-sector');
  },

  setupController: function(controller, model) {
    controller.set('model', model);
    controller.set('statuses', this.store.find('status'));
    controller.set('baseStationUnits', this.store.find('base-station-unit'));
  }
});
