import Ember from 'ember';
import LineSpeeds from 'cops/models/line-speeds';
import ServiceTypes from 'cops/models/service-types';
import PhysicalModes from 'cops/models/physical-modes';

export default Ember.ObjectController.extend({
  needs: "client-link",
  lineSpeeds: LineSpeeds,
  serviceTypes: ServiceTypes,
  physicalModes: PhysicalModes,
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
