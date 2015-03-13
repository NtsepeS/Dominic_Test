import Ember from 'ember';
import LineSpeeds from 'cops/models/line-speeds';

export default Ember.ObjectController.extend({
  needs: "client-link",
  lineSpeeds: LineSpeeds,
  serviceTypes: ['Voice (rtPS)', 'Data 1:1 (nrtPS)', 'Data 1:2 (BE Plus)', 'Broadband (BE)'],
  physicalModes: ['4QAM2/3', '4QAM', '16QAM', '64QAM'],
  actions: {
    saveServiceFragment: function() {
      var serviceFragment = this.store.createRecord('service-fragment', {
        workOrderNumber: this.get('newWorkOrderNumber'),
        lineSpeed:       this.get('newLineSpeed'),
        physicalMode:    this.get('newPhysicalMode'),
        serviceType:     this.get('newServiceType'),
        clientLink:      this.get('controllers.client-link.model')
      });
      serviceFragment.save().then(
        this.transitionToRoute('client-link.service-fragments')
      );
    }
  }
});
