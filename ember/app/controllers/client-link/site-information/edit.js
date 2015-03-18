import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    updateSiteInformation: function() {
      var _this = this;
      this.get('model').save().then( function() {
        _this.transitionToRoute('client-link.site-information');
      });
    }
  }
});
