import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    removeBaseStationUnit: function() {
      var _this = this;

      this.get('model').destroyRecord().then( function() {
        _this.transitionToRoute('base-station-units.index');
      });
    }
  }
});
