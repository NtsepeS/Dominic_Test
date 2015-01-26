import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model: function() {
    var clientLinkModel = this.modelFor('client-link');
    var modelId         =  clientLinkModel.id;
    return Ember.$.getJSON("/api/v1/client_links/"+ modelId + "/audit");
  },
  setupController: function(controller, model) {
    controller.set('content', model.client_links);
  }
});
