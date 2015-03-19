import Ember from 'ember';
import ModulationValues from 'cops/models/modulation-values';

export default Ember.ObjectController.extend({
  needs: "client-link",
  modulationValues: ModulationValues,
  actions: {
    saveModulation: function(){
      this.get('model').save().then(
        this.transitionToRoute('client-link.modulation')
      );
    }
  }
});
