import Ember from 'ember';

export default Ember.ArrayProxy.extend({
  // This should be provided when the object is instantiated
  rfPerformanceParameters: Ember.A([]),
  content: Ember.A([]),

  init: function() {
    this.recalculate();
  },

  paramsChanged: function() {
    this.recalculate();
  }.observes('rfPerformanceParameters.[]'),

  recalculate: function() {
    var _this   = this,
        content = this.get('content'),
        inputs  = this.get('rfPerformanceParameters'),
        buffer  = [];

    content.clear();

    inputs.forEach(function(input, index) {
      buffer.pushObject(input);
      content.pushObject(input);

      if (index > 0 && index % 2 === 1) {
        var calculated = _this.createCalculatedParameter(buffer);
        content.pushObject( calculated );
        buffer = [];
      }
    });

    // notify the world that we've changed
    this.arrayContentDidChange(0);
  },

  createCalculatedParameter: function(buffer) {
    var _this   = this;
    var a = buffer[1],
        b = buffer[0];

    return Ember.Object.create({
      isCalculated:   true,
      rfResultSet:    "Result",
      uplinkRssi:     _this.calculateDifference(a, b, 'uplinkRssi'),
      downlinkRssi:   _this.calculateDifference(a, b, 'downlinkRssi'),
      uplinkCnr:      _this.calculateDifference(a, b, 'uplinkCnr'),
      downlinkCnr:    _this.calculateDifference(a, b, 'downlinkCnr'),
      txPower:        _this.calculateDifference(a, b, 'txPower'),
      stepAttenuator: _this.calculateDifference(a, b, 'stepAttenuator')
    });
  },

  calculateDifference: function(a, b, parameter){
    return Math.round((a.get(parameter) - b.get(parameter))*100)/100;
  }
});
