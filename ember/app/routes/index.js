import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  redirect: function() {
    if (this.session.isAuthenticated) {
      this.transitionTo("links");
    }
  }
});
