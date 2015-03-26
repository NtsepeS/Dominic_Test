import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    removeBaseStationSector: function() {
      var _this = this;

      this.get('model').destroyRecord().then( function() {
        _this.transitionToRoute('base-station-sectors.index');
      });
    }
  }
});
