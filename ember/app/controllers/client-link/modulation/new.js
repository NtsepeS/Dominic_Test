import Ember from 'ember';
import ModulationValues from 'cops/models/modulation-values';

export default Ember.ObjectController.extend({
  needs: "client-link",
  modulationValues: ModulationValues,
  actions: {
    saveModulation: function() {
      var _this = this;
      var radio = this.store.createRecord('radio', {});

      radio.get('modulations').addObject(this.store.createRecord('modulation',{
        modulationResultSet: 'Predicted',
        downlinkMin:         this.get('selectedPredictedDLMin'),
        downlinkMax:         this.get('selectedPredictedDLMax'),
        uplinkMin:           this.get('selectedPredictedULMin'),
        uplinkMax:           this.get('selectedPredictedULMax'),
      }));

      radio.get('modulations').addObject(this.store.createRecord('modulation',{
        modulationResultSet: 'Configured',
        downlinkMin:         this.get('selectedConfiguredDLMin'),
        downlinkMax:         this.get('selectedConfiguredDLMax'),
        uplinkMin:           this.get('selectedConfiguredULMin'),
        uplinkMax:           this.get('selectedConfiguredULMax'),
      }));

      radio.save().then(function() {
        var promises = Ember.A();
        radio.get('modulations').forEach(function(item){
          promises.push(item.save());
        });
        _this.set('radio', radio);

        Ember.RSVP.Promise.all(
          [promises,
          _this.get('model').save()]
        )
        .then(function() {
          _this.transitionToRoute('client-link.modulation');
        })
        .catch(function() {
          console.log('one of the saves failed');
        });
      });
    }
  }


});
