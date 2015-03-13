import Ember from 'ember';
import LineSpeeds from 'cops/models/line-speeds';

export default Ember.ObjectController.extend({
  lineSpeeds: LineSpeeds,
  serviceTypes: ['Voice (rtPS)', 'Data 1:1 (nrtPS)', 'Data 1:2 (BE Plus)', 'Broadband (BE)'],
  physicalModes: ['4QAM2/3', '4QAM', '16QAM', '64QAM'],
  actions: {
    updateServiceFragment: function() {
      this.get('model').save().then(
        this.transitionToRoute('service-fragment', this.get('model.id'))
      );
    }
  }
});
