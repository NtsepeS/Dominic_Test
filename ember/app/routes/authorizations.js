import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel: function() {
    if ( !this.features.isEnabled('manage-authorizations') ) {
      return Ember.RSVP.reject("Manage authorizations disabled");
    }
  },

  model: function() {
    return this.store.find('authorization');
  }
});
