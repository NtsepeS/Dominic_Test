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
