import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('port', {
  // Specify the other units that are required for this test.
  needs: ['model:service', 'model:service-fragment']
});

test('it exists', function(assert) {
  var model = this.subject();
  // var store = this.store();
  assert.ok(!!model);
});
