import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('client-link', 'ClientLink', {
  // Specify the other units that are required for this test.
  needs: ['model:link-type', 'model:antenna', 'model:network-operator',
  'model:base-station-sector', 'model:client', 'model:status',
  'model:sub-group-picture-set', 'model:album', 'model:sub-group-classification',
  'model:location', 'model:service-fragment', 'model:base-station-unit',
  'model:service'
  ]
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(!!model);
});
