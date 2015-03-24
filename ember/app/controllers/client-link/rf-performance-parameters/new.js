import Ember from 'ember';

export default Ember.ObjectController.extend({
  needs: "client-link",

  actions: {
    saveRFPerformance: function() {
      var _this = this;

      var radio = _this.get('model.radio.id');

      if(radio) {
        console.log("WE HAVE AN EXISTING RADIO AND ADD RF");

        var rfPerformanceParameter = _this.createRFPerformanceRecord()
        rfPerformanceParameter.set('radio', _this.get('model.radio'))

        rfPerformanceParameter.save().then(function(){
          _this.transitionToRoute('client-link.rf-performance-parameters');
          _this.resetProperties();
        }).catch(function() {
          console.log('one of the saves failed');
        });

      }
      else {
        console.log("WE CREATE A RADIO, AND ADD RF");

        var Promise = Ember.RSVP.Promise;

        radio = _this.store.createRecord('radio', {});
        radio.get('rfPerformanceParameters').addObject(_this.createRFPerformanceRecord());

        radio.save().then(function() {
          var rfPerformanceArray = Ember.A();
          radio.get('rfPerformanceParameters').forEach(function(item){
            rfPerformanceArray.push(item.save());
          });
          _this.set('radio', radio);

          Promise.all([
            rfPerformanceArray,
            _this.get('model').save()
          ]).then(function() {
            _this.transitionToRoute('client-link.rf-performance-parameters');
            _this.resetProperties();
          }).catch(function() {
            console.log('one of the saves failed');
          });

        });
      }

    }
  },

  createRFPerformanceRecord: function() {
    var record = this.store.createRecord('rf-performance-parameter', {
      rfResultSet:    this.get('rfResultSet'),
      uplinkRssi:     this.get('ULRSSI'),
      downlinkRssi:   this.get('DLRSSI'),
      uplinkCnr:      this.get('ULCNR'),
      downlinkCnr:    this.get('DLCNR'),
      txPower:        this.get('TXPower'),
      stepAttenuator: this.get('StepAttenuator'),
      // radio:          this.get('model.radio')
    });
    return record
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
