import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  templateName:   'base-station-unit/edit',
  controllerName: 'base-station-unit/edit',

  model: function(){
    return this.store.createRecord('base-station-unit');
  },

  setupController: function(controller, model) {
    controller.set('model', model);
    controller.set('statuses', this.store.find('status'));
    controller.set('coreNodes', this.store.find('core-node'));
  }
});
