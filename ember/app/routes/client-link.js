import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model: function(params) {
    var self = this;
    return new Ember.RSVP.Promise(function (resolve) {
      new Ember.RSVP.hash({
        clientLink: self.store.find('client-link', params.clientLinkId),
        linkTypes: self.store.find('link-type'),
      }).then(function (results) {
        resolve({
          clientLink: results.clientLink,
          linkTypes: results.linkTypes
         });
      });
    });
  }
});
