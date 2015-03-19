import Ember from 'ember';

export default Ember.ObjectController.extend({
  setupPromise: function(modelProperty, model) {
    var _this   = this,
        keyName = 'model.' + modelProperty + '.id';

    if (model === undefined) {
      model = modelProperty;
    }

    return new Ember.RSVP.Promise(function(resolve, reject) {
      // Resolve if empty value for promise chain to continue
      if (_this.get(keyName) === undefined ){
        return resolve(undefined);
      }

      // Resolve after save on associated model
      var promise = _this.store.find(model, _this.get(keyName));

      promise.then(function(storeModel) {
        return resolve(storeModel.save());
      });
    });
  },

  actions: {
    updateOverview: function() {
      var _this                    = this,
          clientPromise            = this.setupPromise('client'),
          linkTypePromise          = this.setupPromise('linkType', 'link-type'),
          antennaPromise           = this.setupPromise('antenna'),
          networkOperatorPromise   = this.setupPromise('networkOperator', 'network-operator'),
          baseStationSectorPromise = this.setupPromise('baseStationSector', 'base-station-sector'),
          statusPromise            = this.setupPromise('status');

      Promise.all([
        clientPromise,
        linkTypePromise,
        antennaPromise,
        networkOperatorPromise,
        baseStationSectorPromise,
        statusPromise
      ]).then(function(values){
        _this.get('model').set('client', values[0]);
        _this.get('model').set('linkType',values[1]);
        _this.get('model').set('antenna',values[2]);
        _this.get('model').set('networkOperator',values[3]);
        _this.get('model').set('baseStationSector',values[4]);
        _this.get('model').set('status',values[5]);

        _this.get('model').save().then(function() {
           _this.transitionToRoute('client-link.overview');
        });
      });
    }
  }
});





