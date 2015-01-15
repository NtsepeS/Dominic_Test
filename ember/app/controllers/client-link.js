import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    acceptChanges: function() {
      this.get('model').save();
    },
    removeClientLink: function(){
      var clientLink = this.get('model');
      clientLink.deleteRecord();
      clientLink.save();
    }
  }
});
