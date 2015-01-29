import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('picture', 'Picture', {
  // Specify the other units that are required for this test.
  needs: ['model:album']
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(!!model);
});
