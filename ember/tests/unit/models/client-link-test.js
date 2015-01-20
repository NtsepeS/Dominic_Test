import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('client-link', 'ClientLink', {
  // Specify the other units that are required for this test.
  needs: ['model:link-type', 'model:antenna']
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(!!model);
});
