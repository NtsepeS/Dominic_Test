import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('status', 'Status', {
  // Specify the other units that are required for this test.
  needs: ['model:client-link', 'model:link-type', 'model:antenna', 'model:network-operator', 'model:base-station-sector',
          'model:client', 'model:album', 'model:service-fragment', 'model:radio']
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(!!model);
});
