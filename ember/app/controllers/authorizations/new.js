import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    sendInvite: function() {
      var _this = this;
      this.get('model').save().then(function(){
        _this.transitionToRoute('admin.authorization');
      });
    }
  }
});
