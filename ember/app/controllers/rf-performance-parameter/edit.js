import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    updateRFPerformance: function() {
      this.get('model').save().then(
        this.transitionToRoute('client-link.rf-performance-parameters')
      );
    }
  }
});
