import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('service', {
  // Specify the other units that are required for this test.
  needs: ['model:service-fragment', 'model:port', 'model:client-link']
});

test('it exists', function(assert) {
  var model = this.subject();
  // var store = this.store();
  assert.ok(!!model);
});
