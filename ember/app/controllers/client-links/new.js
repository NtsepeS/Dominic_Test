import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    acceptChanges: function() {
      var _this         = this,
          newClientLink = this.get('model');
      newClientLink.save().then(function(result){
        _this.transitionToRoute('client-link', result.id);
      });
    }
  }
});
