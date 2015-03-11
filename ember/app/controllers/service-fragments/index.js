import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    removeServiceFragment: function() {
      var serviceFragment = this.get('model'),
                    _this = this;

      serviceFragment.destroyRecord().then(function(serviceFragment) {
        _this.transitionToRoute('client-link.service-fragments', serviceFragment.get('clientLink.id'));
      });
    }
  }
});
