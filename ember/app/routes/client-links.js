import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model: function(){
    console.log(this.store.findAll('client_link'));
    return this.store.findAll('client_link');
  }
});
