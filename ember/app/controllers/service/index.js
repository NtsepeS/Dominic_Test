import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    removeService: function() {
      var _this = this,
      service   = this.get('model');

      service.destroyRecord().then(function(service) {
        _this.transitionToRoute('service-fragments.index', service.get('serviceFragment.clientLink.id'), service.get('serviceFragment.id'));
      });
    }
  }
});
