import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    logout: function() {
      console.log("logout");
      this.send('invalidateSession');
      this.transitionToRoute("login");
    }
  }
});