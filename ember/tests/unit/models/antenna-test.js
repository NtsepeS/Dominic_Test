import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('antenna', 'Antenna', {
  // Specify the other units that are required for this test.
  needs: ['model:location', 'model:geometry', 'model:vicinity']
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(!!model);
});
