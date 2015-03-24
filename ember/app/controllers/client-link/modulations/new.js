import Ember from 'ember';
import ModulationValues from 'cops/models/modulation-values';

export default Ember.ObjectController.extend({
  needs: "client-link",
  modulationValues: ModulationValues,

  actions: {
    saveModulation: function() {
      var _this = this;

      var radio = _this.get('model.radio.id');

      if(radio) {
        console.log("WE HAVE AN EXISTING RADIO AND ADD Mod");

        var predictedModulation = this.store.createRecord('modulation',{
          modulationResultSet: 'Predicted',
          downlinkMin:         this.get('selectedPredictedDLMin'),
          downlinkMax:         this.get('selectedPredictedDLMax'),
          uplinkMin:           this.get('selectedPredictedULMin'),
          uplinkMax:           this.get('selectedPredictedULMax'),
          radio:               _this.get('model.radio')
        });

        var configuredModulation = this.store.createRecord('modulation',{
          modulationResultSet: 'Configured',
          downlinkMin:         this.get('selectedConfiguredDLMin'),
          downlinkMax:         this.get('selectedConfiguredDLMax'),
          uplinkMin:           this.get('selectedConfiguredULMin'),
          uplinkMax:           this.get('selectedConfiguredULMax'),
          radio:               _this.get('model.radio')
        });

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
        console.log("WE CREATE A RADIO, AND ADD Mod");

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
            _this.transitionToRoute('client-link.modulations');
          })
          .catch(function() {
            console.log('one of the saves failed');
          });
        });
      }


    }
  }


});
