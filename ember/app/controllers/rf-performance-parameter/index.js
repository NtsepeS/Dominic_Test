import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    deleteRFPerformance: function(){
      var _this              = this,
      rfPerformanceParameter = this.get('model');

      rfPerformanceParameter.destroyRecord().then(function() {
        _this.transitionToRoute('client-link.rf-performance-parameters');
      });
    }
  }
});
