import Ember from 'ember';

export default Ember.Controller.extend({
  needs: "client-link",

  presetName: false,

  actions: {
    saveRFPerformance: function() {
      var _this = this;
      var rfResultSet;
      var radio = _this.get('model.radio.id');

      if(radio) {
        console.log("existing radio id, create new rf");

        var rfPerformanceParameter = this.get('model');
        rfPerformanceParameter.set('radio', _this.get('model.radio'));

        rfPerformanceParameter.save().then(function(){
          _this.transitionToRoute('client-link.rf-performance-parameters');
        }).catch(function() {
          console.log('one of the saves failed');
        });

      }
      else {
        console.log("create radio id, create new rf");

        var Promise = Ember.RSVP.Promise;

        radio = _this.store.createRecord('radio', {});
        radio.get('rfPerformanceParameters').addObject(_this.createRFPerformanceRecord());

        radio.save().then(function() {
          var promises = Ember.A();
          radio.get('rfPerformanceParameters').forEach(function(item){
            promises.push(item.save());
          });
          _this.set('radio', radio);

          Promise.all([
            promises,
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
  }

});
