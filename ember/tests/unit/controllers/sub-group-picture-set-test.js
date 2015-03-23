import {
  moduleFor,
  test
} from 'ember-qunit';

moduleFor('controller:sub-group-picture-set', {
  // Specify the other units that are required for this test.
  // needs: ['controller:foo']
  needs: ['controller:client-link/edit']
});

// Replace this with your real tests.
test('it exists', function(assert) {
  var controller = this.subject();
  assert.ok(controller);
});
