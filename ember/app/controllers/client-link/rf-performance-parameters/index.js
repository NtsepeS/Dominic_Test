import Ember from 'ember';

export default Ember.Controller.extend({
  radio: Ember.computed.alias('model.radio'),

  rfPerformanceParameters: Ember.computed.alias('radio.rfPerformanceParameters'),
  hasRfPerformanceParameters: function() {
    return !Ember.isEmpty( this.get('rfPerformanceParameters') );
  }.property('rfPerformanceParameters.[]'),

  actions: {
    removeRFPerformance: function(rfPerformanceParameter){
      var _this = this;

      var promise = rfPerformanceParameter.destroyRecord();
      var radio = promise.then(function(){
        return rfPerformanceParameter.get('radio');
      });
      var childParameters = radio.then(function(model){
        return model.get('rfPerformanceParameters');
      });
      childParameters.then(function(collection) {
        collection.removeObject( rfPerformanceParameter );
      });
    }
  }
});
