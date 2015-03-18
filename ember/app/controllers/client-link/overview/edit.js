import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    updateOverview: function() {
      var _this = this;
      this.get('model').save().then( function() {
        _this.transitionToRoute('client-link.overview');
      });
    }
  }
});
