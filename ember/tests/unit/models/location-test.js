import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('location', 'Location', {
  // Specify the other units that are required for this test.
  needs: ['model:vicinity', 'model:geometry']
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(!!model);
});
