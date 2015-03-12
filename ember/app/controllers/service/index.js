import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    removeService: function() {
      var service = this.get('model'),
            _this = this;

      service.destroyRecord().then(function(service) {
        _this.transitionToRoute('service-fragments.index', service.get('serviceFragment.clientLink.id'), service.get('serviceFragment.id'));
      });
    }
  }
});
