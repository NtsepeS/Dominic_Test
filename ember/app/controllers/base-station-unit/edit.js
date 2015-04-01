import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    saveBaseStationUnit: function() {
      var _this = this;

      Ember.RSVP.Promise.all([
        _this._saveStatus(),
        _this._saveCoreNode()]
      ).then(function() {
        _this.get('model').save().then( function(baseStationUnit) {
          _this.transitionToRoute('base-station-unit.index', baseStationUnit.id);
        });
      });
    }
  },

  _saveStatus: function() {
    var _this = this;
    _this.get('model').set('status', _this.get('model.status'));

    return new Ember.RSVP.Promise(function(resolve) {
      if (_this.get('model.status.id') == undefined) {
        return resolve(undefined);
      } else {
        var promise = _this.store.find('status', _this.get('model.status.id'));

        promise.then(function(status) {
          return resolve(status.save());
        });
      }
    });
  },

  _saveCoreNode: function() {
    var _this = this;
    _this.get('model').set('coreNode', _this.get('model.coreNode'));

    return new Ember.RSVP.Promise(function(resolve) {
      if (_this.get('model.coreNode.id') == undefined) {
        return resolve(undefined);
      } else {
        var promise = _this.store.find('core-node', _this.get('model.coreNode.id'));

        promise.then(function(coreNode) {
          return resolve(coreNode.save());
        });
      }
    });
  }
});
