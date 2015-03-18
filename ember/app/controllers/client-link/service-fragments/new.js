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
      var _this           = this,
          serviceFragment = this.store.createRecord('service-fragment', {
            workOrderNumber: _this.get('newWorkOrderNumber'),
            lineSpeed:       _this.get('newLineSpeed'),
            physicalMode:    _this.get('newPhysicalMode'),
            serviceType:     _this.get('newServiceType'),
            clientLink:      _this.get('controllers.client-link.model')
          });

      serviceFragment.save().then( function() {
        _this.transitionToRoute('client-link.service-fragments');
      });
    }
  }
});
