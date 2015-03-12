import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    sendInvite: function() {
      var self = this;
      console.log("hi")
      var invite = self.get('model').save().then(function(){
        self.transitionToRoute('admin.authorization');
      });
    }
  }
});
