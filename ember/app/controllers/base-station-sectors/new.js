import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    saveBaseStationUnit: function() {
      var _this = this,
        baseStationSector = this.store.createRecord('base-station-sector', {
          name:            _this.get('selectedName'),
          sector:          _this.get('selectedSector'),
          status:          _this.get('selectedStatus'),
          baseStationUnit: _this.get('selectedBaseStationUnit')
        });


      Promise.all([
        _this._saveStatus()],
        _this._saveBaseStationUnit()
      ).then(function() {
        baseStationSector.save().then( function(status) {
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
    return new Ember.RSVP.Promise(function(resolve) {
      var promise = _this.store.find('status', _this.get('selectedStatus.id'));

      promise.then(function(status) {
        return resolve(status.save());
      });
    });
  },

  _saveBaseStationUnit: function() {
    var _this = this;
    return new Ember.RSVP.Promise(function(resolve) {
      var promise = _this.store.find('base-station-unit', _this.get('selectedBaseStationUnit.id'));

      promise.then(function(baseStationUnit) {
        return resolve(baseStationUnit.save());
      });
    });
  }
});
