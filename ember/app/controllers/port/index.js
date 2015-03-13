import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    removePort: function() {
      var _this = this,
      port      = this.get('model');

      port.destroyRecord().then(function(port) {
        _this.transitionToRoute('service.index', port.get('service.serviceFragment.clientLink.id'), port.get('service.serviceFragment.id'));
      });
    }
  }
});
