import Ember from 'ember';
import LineSpeeds from 'cops/models/line-speeds';
import ServiceTypes from 'cops/models/service-types';
import PhysicalModes from 'cops/models/physical-modes';

export default Ember.ObjectController.extend({
  lineSpeeds: LineSpeeds,
  serviceTypes: ServiceTypes,
  physicalModes: PhysicalModes,
  actions: {
    updateServiceFragment: function() {
      var _this = this;
      this.get('model').save().then( function() {
        _this.transitionToRoute('service-fragment', _this.get('model.id'));
      });
    }
  }
});
