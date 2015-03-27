import Ember from 'ember';
import MapFiltersMixin from '../../../mixins/map-filters';
import { module, test } from 'qunit';

module('MapFiltersMixin');

// Replace this with your real tests.
test('it works', function(assert) {
  var MapFiltersObject = Ember.Object.extend(MapFiltersMixin);
  var subject = MapFiltersObject.create();
  assert.ok(subject);
});
