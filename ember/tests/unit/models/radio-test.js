import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('radio', {
  // Specify the other units that are required for this test.
  needs: ['model:modulation', 'model:rf-performance-parameter']
});

test('it exists', function(assert) {
  var model = this.subject();
  // var store = this.store();
  assert.ok(!!model);
});
