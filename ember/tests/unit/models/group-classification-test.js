import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('group-classification', 'GroupClassification', {
  // Specify the other units that are required for this test.
  needs: ['model:sub-group-classification']
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(!!model);
});
