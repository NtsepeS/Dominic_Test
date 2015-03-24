import Ember from 'ember';
import ModulationValues from 'cops/models/modulation-values';

export default Ember.ObjectController.extend({
  needs: "client-link",
  modulationValues: ModulationValues,

  actions: {
    saveModulation: function() {
      var _this = this;
      var Promise = Ember.RSVP.Promise;

      var radio = _this.get('model.radio.id');

      if(radio) {
        console.log("existing radio id, create new modulations");

        var predictedModulation = _this.createPredictedModulationRecord();
        predictedModulation.set('radio', _this.get('model.radio'));

        var configuredModulation = _this.createConfiguredModulationRecord();
        configuredModulation.set('radio', _this.get('model.radio'));

        Promise.all([
          predictedModulation.save(),
          configuredModulation.save()
        ]).then(function(){
          _this.transitionToRoute('client-link.modulations');
        }).catch(function() {
          console.log('one of the saves failed');
        });

      }
      else {
        console.log("create radio id, create new modulations");

        radio = _this.store.createRecord('radio', {});

        radio.get('modulations').addObject(_this.createPredictedModulationRecord());

        radio.get('modulations').addObject(_this.createConfiguredModulationRecord());

        radio.save().then(function() {
          var promises = Ember.A();
          radio.get('modulations').forEach(function(item){
            promises.push(item.save());
          });
          _this.set('radio', radio);

          Promise.all(
            [promises,
            _this.get('model').save()]
          )
          .then(function() {
            _this.transitionToRoute('client-link.modulations');
          })
          .catch(function() {
            console.log('one of the saves failed');
          });
        });
      }

    }
  },

  createConfiguredModulationRecord: function() {
    var record = this.store.createRecord('modulation',{
      modulationResultSet: 'Configured',
      downlinkMin:         this.get('selectedConfiguredDLMin'),
      downlinkMax:         this.get('selectedConfiguredDLMax'),
      uplinkMin:           this.get('selectedConfiguredULMin'),
      uplinkMax:           this.get('selectedConfiguredULMax'),
    });
    return record;
  },

  createPredictedModulationRecord: function() {
    var record = this.store.createRecord('modulation',{
      modulationResultSet: 'Predicted',
      downlinkMin:         this.get('selectedPredictedDLMin'),
      downlinkMax:         this.get('selectedPredictedDLMax'),
      uplinkMin:           this.get('selectedPredictedULMin'),
      uplinkMax:           this.get('selectedPredictedULMax'),
    });
    return record;
  }



});
