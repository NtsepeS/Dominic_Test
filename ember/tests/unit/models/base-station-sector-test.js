import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('base-station-sector', 'BaseStationSector', {
  // Specify the other units that are required for this test.
  needs: ['model:status', 'model:base-station-unit', 'model:client-link', 'model:core-node',
   'model:link-type', 'model:antenna', 'model:network-operator', 'model:client',
   'model:sub-group-picture-set', 'model:radio', 'model:service-fragment']
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(!!model);
});
