import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    acceptChanges: function() {
      var _this        = this,
      editedClientLink = _this.get('model');
      editedClientLink.save().then(function(result){
        _this.transitionToRoute('client-link', result.id);
      });
    },
    removeClientLink: function(){
      var _this  = this,
      clientLink = this.get('model');
      clientLink.deleteRecord();
      clientLink.save().then(function(){
        _this.transitionToRoute('client-links');
      });
    }
  }
});
