import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('link-type', 'LinkType', {
  // Specify the other units that are required for this test.
  needs: ['model:client-link', 'model:antenna', 'model:network-operator',
          'model:base-station-sector', 'model:client', 'model:status',
          'model:album', 'model:service-fragment', 'model:radio']
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(!!model);
});
