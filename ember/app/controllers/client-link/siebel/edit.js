import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    updateSiebel: function() {
      this.get('model').save().then(
        this.transitionToRoute('client-link.siebel')
      );
    }
  }
});
