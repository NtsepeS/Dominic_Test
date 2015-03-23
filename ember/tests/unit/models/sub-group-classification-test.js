import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('sub-group-classification', 'SubGroupClassification', {
  // Specify the other units that are required for this test.
  needs: ['model:group-classification', 'model:sub-group-picture-set',
  'model:album', 'model:client-link']
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(!!model);
});
