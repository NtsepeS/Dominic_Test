import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    acceptChanges: function() {
      this.get('model').save();
    }
  }
});
