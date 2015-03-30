import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model: function() {
    return this.modelFor('client-link');
  },

  redirect: function() {
    this.transitionTo('client-link.overview.index');
  }
});
