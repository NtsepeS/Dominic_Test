import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('equipment-type', {
  // Specify the other units that are required for this test.
  needs: ['model:equipment']
});

test('it exists', function(assert) {
  var model = this.subject();
  // var store = this.store();
  assert.ok(!!model);
});
