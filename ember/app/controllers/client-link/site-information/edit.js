import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    updateSiteInformation: function() {
      this.get('model').save().then(
        this.transitionToRoute('client-link.site-information')
      );
    }
  }
});
