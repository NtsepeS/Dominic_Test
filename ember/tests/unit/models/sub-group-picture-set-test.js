import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('sub-group-picture-set', 'SubGroupPictureSet', {
  // Specify the other units that are required for this test.
  needs: ['model:sub-group-classification', 'model:album', 'model:client-link',
    'model:picture', 'model:sub-group-classification', 'model:group-classification',
    'model:link-type', 'model:antenna', 'model:network-operator',
    'model:base-station-sector', 'model:client', 'model:status', 'model:service-fragment',
    'model:radio'
    ]
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(!!model);
});
