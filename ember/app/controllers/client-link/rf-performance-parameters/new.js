import Ember from 'ember';

export default Ember.ObjectController.extend({
  needs:          "client-link",

  actions: {
    saveRFPerformance: function() {
      var _this = this;

      var radio = _this.get('model.radio.id');
      if(radio){
        console.log("WE HAVE AN EXISTING RADIO AND ADD RF");
        var rfPerformanceParameter = _this.store.createRecord('rf-performance-parameter', {
          rfResultSet:    _this.get('rfResultSet'),
          uplinkRssi:     _this.get('ULRSSI'),
          downlinkRssi:   _this.get('DLRSSI'),
          uplinkCnr:      _this.get('ULCNR'),
          downlinkCnr:    _this.get('DLCNR'),
          txPower:        _this.get('TXPower'),
          stepAttenuator: _this.get('StepAttenuator'),
          radio:          _this.get('model.radio')
        });

        rfPerformanceParameter.save().then(function(){
          _this.transitionToRoute('client-link.rf-performance-parameters');
          _this.resetProperties();
        }).catch(function() {
            console.log('one of the saves failed');
          });
      }
      else {
        console.log("WE CREATE A RADIO, AND ADD RF");
        radio = _this.store.createRecord('radio', {});
        radio.get('rfPerformanceParameters').addObject(_this.store.createRecord('rf-performance-parameter', {
          rfResultSet:    _this.get('rfResultSet'),
          uplinkRssi:     _this.get('ULRSSI'),
          downlinkRssi:   _this.get('DLRSSI'),
          uplinkCnr:      _this.get('ULCNR'),
          downlinkCnr:    _this.get('DLCNR'),
          txPower:        _this.get('TXPower'),
          stepAttenuator: _this.get('StepAttenuator'),
        })
        );

        radio.save().then(function() {
          var promises = Ember.A();
          radio.get('rfPerformanceParameters').forEach(function(item){
            promises.push(item.save());
          });
          _this.set('radio', radio);

          Ember.RSVP.Promise.all(
            [promises,
            _this.get('model').save()]
          )
          .then(function() {
            _this.transitionToRoute('client-link.rf-performance-parameters');
            _this.resetProperties();
          })
          .catch(function() {
            console.log('one of the saves failed');
          });
        });
      }

    }
  },

  resetProperties: function() {
    this.setProperties({
          rfResultSet:    null,
          ULRSSI:         null,
          DLRSSI:         null,
          ULCNR:          null,
          DLCNR:          null,
          TXPower:        null,
          StepAttenuator: null,
    })
  }

});
