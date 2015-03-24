import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    saveBaseStationUnit: function() {
      var _this = this;

      Promise.all([
        _this._saveStatus()],
        _this._saveBaseStationUnit()
      ).then(function() {
        _this.get('model').save().then( function(status) {
          _this.resetProperties();
          _this.transitionToRoute('base-station-sectors.index');
        });
      });
    }
  },

  resetProperties: function() {
    this.setProperties({ selectedName: null,
                         selectedSector: null,
                          selectedStatus: null,
                          selectedBaseStationUnit: null});
  },

  _saveStatus: function() {
    var _this = this;
    _this.get('model').set('status', _this.get('selectedStatus'));

    return new Ember.RSVP.Promise(function(resolve) {
      var promise = _this.store.find('status', _this.get('selectedStatus.id'));

      promise.then(function(status) {
        return resolve(status.save());
      });
    });
  },

  _saveBaseStationUnit: function() {
    var _this = this;
    _this.get('model').set('baseStationUnit', _this.get('selectedBaseStationUnit'));

    return new Ember.RSVP.Promise(function(resolve) {
      var promise = _this.store.find('base-station-unit', _this.get('model.baseStationUnit.id'));

      promise.then(function(baseStationUnit) {
        return resolve(baseStationUnit.save());
      });
    });
  }
});
