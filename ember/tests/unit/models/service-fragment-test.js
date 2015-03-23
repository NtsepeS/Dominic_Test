import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('service-fragment', {
  // Specify the other units that are required for this test.
  needs: ['model:service', 'model:client-link', 'model:port', 'model:link-type',
  'model:antenna', 'model:network-operator', 'model:base-station-sector',
  'model:client', 'model:status', 'model:sub-group-picture-set', 'model:radio']
});

test('it exists', function(assert) {
  var model = this.subject();
  // var store = this.store();
  assert.ok(!!model);
});
