import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('antenna', 'Antenna', {
  // Specify the other units that are required for this test.
  needs: ['model:location', 'model:geometry', 'model:vicinity', 'model:client-link',
          'model:link-type', 'model:network-operator', 'model:base-station-sector',
          'model:client', 'model:status', 'model:sub-group-picture-set', 'model:service-fragment', 'model:radio']
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(!!model);
});
