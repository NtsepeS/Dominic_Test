import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('album', 'Album', {
  // Specify the other units that are required for this test.
  needs: ['model:picture', 'model:sub-group-classification', 'model:client-link',
  'model:group-classification', 'model:link-type',  'model:antenna', 'model:network-operator',
  'model:base-station-sector', 'model:status', 'model:album', 'model:service-fragment',
  'model:radio', 'model:client'
  ]
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(!!model);
});
