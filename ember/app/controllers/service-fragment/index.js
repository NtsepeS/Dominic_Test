import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    removeServiceFragment: function() {
      var _this       = this,
      serviceFragment = this.get('model');

      serviceFragment.destroyRecord().then(function(serviceFragment) {
        _this.transitionToRoute('client-link.service-fragments', serviceFragment.get('clientLink.id'));
      });
    }
  }
});
