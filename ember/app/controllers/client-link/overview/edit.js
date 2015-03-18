import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    updateOverview: function() {
      var _this = this;

// (WIP!!!!!!!!!)
// This mess is because when saving assocaited models the parent models doesn't persist
// https://github.com/emberjs/data/issues/437#issuecomment-9782817
// https://github.com/emberjs/data/pull/724
// http://discuss.emberjs.com/t/saving-multiple-hasmany/4907

      this.store.find('client', this.get('model.client.id')).then(function(client) {
        client.save().then(function(client) {
          _this.get('model').set('client',client);

          _this.store.find('link-type', _this.get('model.linkType.id')).then(function(linkType) {
            linkType.save().then(function(linkType) {
              _this.get('model').set('linkType', linkType);

              _this.store.find('antenna', _this.get('model.antenna.id')).then(function(antenna) {
                antenna.save().then(function(antenna) {
                  _this.get('model').set('antenna', antenna);

                  _this.store.find('network-operator', _this.get('model.networkOperator.id')).then(function(networkOperator) {
                    networkOperator.save().then(function(networkOperator) {
                      _this.get('model').set('networkOperator', networkOperator);

                      _this.store.find('base-station-sector', _this.get('model.baseStationSector.id')).then(function(baseStationSector) {
                        baseStationSector.save().then(function(baseStationSector) {
                          _this.get('model').set('baseStationSector', baseStationSector);

                          _this.store.find('status', _this.get('model.status.id')).then(function(status) {
                          status.save().then(function(status) {
                            _this.get('model').set('status', status);

                            _this.get('model').save().then(function() {
                               _this.transitionToRoute('client-link.overview');
                            });


                          });
                        });
                      });
                    });
                  });
                });
              });
            });
          });
        });
      });
    });
    }
  }
});





