import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model: function() {
    return this.modelFor('pictures');
  },

  setupController: function(controller) {
    controller.set('subGroupClassifications', this.store.find('sub-group-classification'));
    controller.set('groupClassifications', this.store.find('group-classification'));
  }
});
