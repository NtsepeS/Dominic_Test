import Ember from 'ember';

export default Ember.ObjectController.extend({
  invite_error:false,
  error: undefined,
  actions: {
    sendInvite: function() {
      var _this = this;
      this.get('model').save().then(function(){
        _this.transitionToRoute('authorizations');
      }, function(value){
        var errors = value.errors;
        if (errors['network']){
          _this.set('error',"The backend timed out please try again later.");
        } else {
          _this.set('error',"Please check your network connection and try again.");
        }
        _this.set('invite_error', true);
      });
    }
  }
});
