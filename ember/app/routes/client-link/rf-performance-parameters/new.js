import Ember from 'ember';

export default Ember.Route.extend({

  model: function(){
    var _this = this,
        clientLink = this.modelFor('client-link');

    return clientLink.get('radio').then(function(radio) {
      return _this.store.createRecord('rf-performance-parameter', {
        radio: radio
      });
    });
  },

  setupController: function(controller, model) {
    controller.set('model', model);
    controller.set('presetName', false);

    var clientLink = this.modelFor('client-link'),
        len = clientLink.get('radio.rfPerformanceParameters.length');

    if (len === 1) {
      model.set('rfResultSet', "Predicted");
      controller.set('presetName', true);
    }
    if (len === 2) {
      model.set('rfResultSet', "Configured");
      controller.set('presetName', true);
    }
  }
});
