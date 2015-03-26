import Ember from 'ember';

export default Ember.ArrayProxy.extend({
  // This should be provided when the object is instantiated
  rfPerformanceParameters: Ember.A([]),
  content: Ember.A([]),

  init: function() {
    this.recalculate();
  },

  paramsChanged: function() {
    console.log(":efzdfdzz");
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
    var a = buffer[1],
        b = buffer[0];

    return Ember.Object.create({
      isCalculated:   true,
      rfResultSet:    "Result",
      uplinkRssi:     a.get('uplinkRssi')     - b.get('uplinkRssi'),
      downlinkRssi:   a.get('downlinkRssi')   - b.get('downlinkRssi'),
      uplinkCnr:      a.get('uplinkCnr')      - b.get('uplinkCnr'),
      downlinkCnr:    a.get('downlinkCnr')    - b.get('downlinkCnr'),
      txPower:        a.get('txPower')        - b.get('txPower'),
      stepAttenuator: a.get('stepAttenuator') - b.get('stepAttenuator')
    });
  },
});
