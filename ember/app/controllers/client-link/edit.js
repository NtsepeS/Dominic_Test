import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    acceptChanges: function() {
      var self = this;
      var editedClientLink = self.get('model');
      editedClientLink.save().then(function(result){
        self.transitionToRoute('client-link', result.id);
      });
    },
    removeClientLink: function(){
      var self = this;
      var clientLink = this.get('model');
      clientLink.deleteRecord();
      clientLink.save().then(function(){
        self.transitionToRoute('client-links');
      });
    },
    pictureUploaded: function(data) {
      this.store.pushPayload(data);
    }
  }
});
