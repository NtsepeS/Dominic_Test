import Ember from 'ember';
import CalculatedRfPerformance from 'cops/models/calculated-rf-performance';

export default Ember.Route.extend({

  model: function() {
    var clientLink = this.modelFor('client-link');
    return clientLink.get('radio.rfPerformanceParameters');
  },

  setupController: function(controller, model) {
    var calculatedParameters = CalculatedRfPerformance.create({
        rfPerformanceParameters: model
    });
    this.controller.set('model', calculatedParameters);
  }
});
