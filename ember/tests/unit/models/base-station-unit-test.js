import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('base-station-unit', {
  // Specify the other units that are required for this test.
  needs: ['model:status', 'model:base-station-sector', 'model:core-node',
  'model:link-type', 'model:location', 'model:city', 'model:antenna',
  'model:network-operator', 'model:client-link', 'model:client',
  'model:album', 'model:service-fragment']
});

test('it exists', function(assert) {
  var model = this.subject();
  // var store = this.store();
  assert.ok(!!model);
});
