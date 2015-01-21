import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    acceptChanges: function() {
      var self = this;
      var newClientLink = self.get('model')
      newClientLink.save().then(function(result){
        self.transitionToRoute('client-link', result.id);
      });
    }
  }
});
