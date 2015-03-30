import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('vicinity', 'Vicinity', {
  // Specify the other units that are required for this test.
  needs: ['model:location', 'model:geometry']
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(!!model);
});
