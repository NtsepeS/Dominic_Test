import Ember from 'ember';
import LineSpeeds from 'cops/models/line-speeds';
import ServiceTypes from 'cops/models/service-types';
import PhysicalModes from 'cops/models/physical-modes';

export default Ember.Controller.extend({
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
        _this.resetProperties();
        _this.transitionToRoute('client-link.service-fragments');

      });
    }
  },

  resetProperties: function() {
    // A Controller in Ember is a singleton - so the controller is never torn down.
    // It lives on, keeping its properties... and we need to reset these properties
    // so that when creating a new service fragment the previous properties is not displayed in
    // the template.
    this.setProperties({ newWorkOrderNumber: null,
                         newLineSpeed: null,
                         newPhysicalMode: null,
                         newServiceType:null });
  }
});
