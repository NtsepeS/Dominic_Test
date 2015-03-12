import Ember from 'ember';
import LineSpeeds from 'cops/models/line-speeds';

export default Ember.ObjectController.extend({
  lineSpeeds: LineSpeeds,
  actions: {
    updateService: function() {
      this.get('model').save().then(
        this.transitionToRoute('service', this.get('model.id'))
      );
    }
  }
});
