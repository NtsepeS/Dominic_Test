import Ember from 'ember';

export default Ember.ObjectController.extend({
  lineSpeeds: [0.25, 0.5, 0.75, 1, 1.5, 2, 3, 4 ,5, 6, 7, 8, 9, 10, 12, 14, 15, 16, 18 ,20, 25, 30, 35, 40, 45, 50],
  actions: {
    updateService: function() {
      this.get('model').save().then(
        this.transitionToRoute('service', this.get('model.id'))
      );
    }
  }
});
