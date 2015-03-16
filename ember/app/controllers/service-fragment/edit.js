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
      this.get('model').save().then(
        this.transitionToRoute('service-fragment', this.get('model.id'))
      );
    }
  }
});
