import Ember from 'ember';
import LineSpeeds from 'cops/models/line-speeds';

export default Ember.ObjectController.extend({
  lineSpeeds: LineSpeeds,
  actions: {
    updateService: function() {
      var _this = this;
      this.get('model').save().then( function() {
        _this.transitionToRoute('service', _this.get('model.id'));
      });
    }
  }
});
