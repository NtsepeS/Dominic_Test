import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('param-type', 'ParamType', {
  // Specify the other units that are required for this test.
  needs: ['model:operating-parameter', 'model:location']
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(!!model);
});
